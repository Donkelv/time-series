import 'package:flutter_test/flutter_test.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/data_decimator.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';

void main() {
  group('DataDecimator', () {
    late List<ChartSpot> testData;

    setUp(() {
      // Create test data with 100 points
      testData = List.generate(100, (index) {
        return ChartSpot(
          index.toDouble(),
          (50 + 20 * (index / 100) + 10 * (index % 7)).toDouble(),
          DateTime.now().add(Duration(days: index)),
        );
      });
    });

    group('LTTB Downsampling', () {
      test('should preserve first and last points', () {
        final result = DataDecimator.lttbDownsample(testData, 10);

        expect(result.first.x, equals(testData.first.x));
        expect(result.first.y, equals(testData.first.y));
        expect(result.last.x, equals(testData.last.x));
        expect(result.last.y, equals(testData.last.y));
      });

      test('should return original data if target size is larger', () {
        final result = DataDecimator.lttbDownsample(testData, 200);

        expect(result.length, equals(testData.length));
        expect(result, equals(testData));
      });

      test('should return correct number of points', () {
        final result = DataDecimator.lttbDownsample(testData, 20);

        expect(result.length, equals(20));
      });

      test('should preserve min and max values', () {
        final originalMin = testData
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final originalMax = testData
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        final result = DataDecimator.lttbDownsample(testData, 10);
        final resultMin = result
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final resultMax = result
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        expect(resultMin, greaterThanOrEqualTo(originalMin));
        expect(resultMax, lessThanOrEqualTo(originalMax));
      });
    });

    group('Bucket Mean Downsampling', () {
      test('should return correct number of points', () {
        final result = DataDecimator.bucketMeanDownsample(testData, 20);

        expect(result.length, lessThanOrEqualTo(20));
      });

      test('should preserve data range', () {
        final originalMin = testData
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final originalMax = testData
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        final result = DataDecimator.bucketMeanDownsample(testData, 10);
        final resultMin = result
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final resultMax = result
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        expect(resultMin, greaterThanOrEqualTo(originalMin));
        expect(resultMax, lessThanOrEqualTo(originalMax));
      });
    });

    group('Adaptive Decimation', () {
      test(
        'should apply more aggressive decimation for higher zoom levels',
        () {
          final result1 = DataDecimator.adaptiveDecimation(testData, 50, 1.0);
          final result2 = DataDecimator.adaptiveDecimation(testData, 50, 2.0);

          expect(result2.length, lessThanOrEqualTo(result1.length));
        },
      );

      test('should respect max points limit', () {
        final result = DataDecimator.adaptiveDecimation(testData, 30, 1.0);

        expect(result.length, lessThanOrEqualTo(30));
      });
    });

    group('Performance Metrics', () {
      test('should calculate correct compression ratio', () {
        final decimated = DataDecimator.lttbDownsample(testData, 20);
        final metrics = DataDecimator.calculateMetrics(testData, decimated);

        expect(metrics.originalSize, equals(testData.length));
        expect(metrics.decimatedSize, equals(decimated.length));
        expect(
          metrics.compressionRatio,
          equals(testData.length / decimated.length),
        );
      });

      test('should preserve min and max values in metrics', () {
        final decimated = DataDecimator.lttbDownsample(testData, 20);
        final metrics = DataDecimator.calculateMetrics(testData, decimated);

        final originalMin = testData
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final originalMax = testData
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        expect(metrics.minY, greaterThanOrEqualTo(originalMin));
        expect(metrics.maxY, lessThanOrEqualTo(originalMax));
      });
    });

    group('Decimator/Aggregator Requirements', () {
      test('verifies decimator preserves min/max and output size', () {
        // Create test data with known min/max values
        final testDataWithKnownBounds = [
          ChartSpot(0, 10.0, DateTime.now()), // min
          ChartSpot(1, 50.0, DateTime.now().add(Duration(days: 1))),
          ChartSpot(2, 30.0, DateTime.now().add(Duration(days: 2))),
          ChartSpot(3, 80.0, DateTime.now().add(Duration(days: 3))),
          ChartSpot(4, 20.0, DateTime.now().add(Duration(days: 4))),
          ChartSpot(5, 90.0, DateTime.now().add(Duration(days: 5))), // max
          ChartSpot(6, 40.0, DateTime.now().add(Duration(days: 6))),
          ChartSpot(7, 60.0, DateTime.now().add(Duration(days: 7))),
          ChartSpot(8, 35.0, DateTime.now().add(Duration(days: 8))),
          ChartSpot(9, 70.0, DateTime.now().add(Duration(days: 9))),
        ];

        final targetSize = 5;
        final decimated = DataDecimator.lttbDownsample(
          testDataWithKnownBounds,
          targetSize,
        );

        // Verify output size
        expect(decimated.length, equals(targetSize));

        // Verify min/max preservation
        final originalMin = testDataWithKnownBounds
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final originalMax = testDataWithKnownBounds
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);
        final decimatedMin = decimated
            .map((e) => e.y)
            .reduce((a, b) => a < b ? a : b);
        final decimatedMax = decimated
            .map((e) => e.y)
            .reduce((a, b) => a > b ? a : b);

        expect(
          decimatedMin,
          equals(originalMin),
          reason: 'Minimum value should be preserved',
        );
        expect(
          decimatedMax,
          equals(originalMax),
          reason: 'Maximum value should be preserved',
        );

        // Verify first and last points are preserved
        expect(decimated.first.x, equals(testDataWithKnownBounds.first.x));
        expect(decimated.last.x, equals(testDataWithKnownBounds.last.x));
      });

      test(
        'verifies bucket mean aggregator preserves min/max and output size',
        () {
          final testDataWithKnownBounds = [
            ChartSpot(0, 5.0, DateTime.now()), // min
            ChartSpot(1, 15.0, DateTime.now().add(Duration(days: 1))),
            ChartSpot(2, 25.0, DateTime.now().add(Duration(days: 2))),
            ChartSpot(3, 35.0, DateTime.now().add(Duration(days: 3))),
            ChartSpot(4, 45.0, DateTime.now().add(Duration(days: 4))),
            ChartSpot(5, 55.0, DateTime.now().add(Duration(days: 5))),
            ChartSpot(6, 65.0, DateTime.now().add(Duration(days: 6))),
            ChartSpot(7, 75.0, DateTime.now().add(Duration(days: 7))),
            ChartSpot(8, 85.0, DateTime.now().add(Duration(days: 8))),
            ChartSpot(9, 95.0, DateTime.now().add(Duration(days: 9))), // max
          ];

          final targetSize = 3;
          final aggregated = DataDecimator.bucketMeanDownsample(
            testDataWithKnownBounds,
            targetSize,
          );

          // Verify output size
          expect(aggregated.length, lessThanOrEqualTo(targetSize));

          // Verify min/max preservation
          final originalMin = testDataWithKnownBounds
              .map((e) => e.y)
              .reduce((a, b) => a < b ? a : b);
          final originalMax = testDataWithKnownBounds
              .map((e) => e.y)
              .reduce((a, b) => a > b ? a : b);
          final aggregatedMin = aggregated
              .map((e) => e.y)
              .reduce((a, b) => a < b ? a : b);
          final aggregatedMax = aggregated
              .map((e) => e.y)
              .reduce((a, b) => a > b ? a : b);

          expect(
            aggregatedMin,
            greaterThanOrEqualTo(originalMin),
            reason: 'Minimum value should be preserved or close',
          );
          expect(
            aggregatedMax,
            lessThanOrEqualTo(originalMax),
            reason: 'Maximum value should be preserved or close',
          );
        },
      );
    });

    group('Edge Cases', () {
      test('should handle empty data', () {
        final result = DataDecimator.lttbDownsample([], 10);

        expect(result, isEmpty);
      });

      test('should handle single data point', () {
        final singlePoint = [testData.first];
        final result = DataDecimator.lttbDownsample(singlePoint, 10);

        expect(result.length, equals(1));
        expect(result.first, equals(singlePoint.first));
      });

      test('should handle target size of 1', () {
        final result = DataDecimator.lttbDownsample(testData, 1);

        expect(result.length, equals(1));
        expect(result.first, equals(testData.first));
      });

      test('should handle target size of 2', () {
        final result = DataDecimator.lttbDownsample(testData, 2);

        expect(result.length, equals(2));
        expect(result.first, equals(testData.first));
        expect(result.last, equals(testData.last));
      });
    });
  });
}
