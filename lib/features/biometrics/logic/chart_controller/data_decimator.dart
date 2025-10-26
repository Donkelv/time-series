import 'dart:math';

import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';

/// Data decimation utility for performance optimization with large datasets
class DataDecimator {
  /// LTTB (Largest Triangle Three Buckets) algorithm for downsampling
  /// Preserves important data points while reducing dataset size
  static List<ChartSpot> lttbDownsample(List<ChartSpot> data, int targetSize) {
    if (data.length <= targetSize) return data;
    if (targetSize < 3) return data.take(targetSize).toList();

    final List<ChartSpot> sampled = [data.first]; // Always keep first point
    final double bucketSize = (data.length - 2) / (targetSize - 2);

    for (int i = 1; i < targetSize - 1; i++) {
      final int bucketStart = (i * bucketSize).floor() + 1;
      final int bucketEnd = ((i + 1) * bucketSize).floor() + 1;

      // Find the point with the largest triangle area
      double maxArea = -1;
      ChartSpot? selectedPoint;

      for (int j = bucketStart; j < bucketEnd && j < data.length; j++) {
        final double area = _calculateTriangleArea(
          sampled.last,
          data[j],
          data[min(bucketEnd, data.length - 1)],
        );

        if (area > maxArea) {
          maxArea = area;
          selectedPoint = data[j];
        }
      }

      if (selectedPoint != null) {
        sampled.add(selectedPoint);
      }
    }

    sampled.add(data.last); // Always keep last point
    return sampled;
  }

  /// Bucket mean aggregation for simple downsampling
  static List<ChartSpot> bucketMeanDownsample(
    List<ChartSpot> data,
    int targetSize,
  ) {
    if (data.length <= targetSize) return data;

    final List<ChartSpot> sampled = [];
    final int bucketSize = (data.length / targetSize).ceil();

    for (int i = 0; i < data.length; i += bucketSize) {
      final int endIndex = min(i + bucketSize, data.length);
      final List<ChartSpot> bucket = data.sublist(i, endIndex);

      if (bucket.isNotEmpty) {
        final double avgX =
            bucket.map((e) => e.x).reduce((a, b) => a + b) / bucket.length;
        final double avgY =
            bucket.map((e) => e.y).reduce((a, b) => a + b) / bucket.length;
        final DateTime avgDate = bucket
            .map((e) => e.date)
            .reduce((a, b) => a.isBefore(b) ? a : b);

        sampled.add(ChartSpot(avgX, avgY, avgDate));
      }
    }

    return sampled;
  }

  /// Adaptive decimation based on data density and zoom level
  static List<ChartSpot> adaptiveDecimation(
    List<ChartSpot> data,
    int maxPoints,
    double zoomLevel,
  ) {
    if (data.length <= maxPoints) return data;

    // More aggressive decimation for higher zoom levels
    final int targetSize =
        (maxPoints * (1.0 - (zoomLevel - 1.0) * 0.3)).round();
    final int finalTargetSize = max(10, min(targetSize, maxPoints));

    return lttbDownsample(data, finalTargetSize);
  }

  /// Calculate triangle area for LTTB algorithm
  static double _calculateTriangleArea(ChartSpot a, ChartSpot b, ChartSpot c) {
    return ((a.x - c.x) * (b.y - a.y) - (a.x - b.x) * (c.y - a.y)).abs() / 2.0;
  }

  /// Performance metrics for decimation
  static DecimationMetrics calculateMetrics(
    List<ChartSpot> original,
    List<ChartSpot> decimated,
  ) {
    return DecimationMetrics(
      originalSize: original.length,
      decimatedSize: decimated.length,
      compressionRatio: original.length / decimated.length,
      minY: decimated.map((e) => e.y).reduce((a, b) => a < b ? a : b),
      maxY: decimated.map((e) => e.y).reduce((a, b) => a > b ? a : b),
    );
  }
}

/// Metrics for decimation performance
class DecimationMetrics {
  final int originalSize;
  final int decimatedSize;
  final double compressionRatio;
  final double minY;
  final double maxY;

  DecimationMetrics({
    required this.originalSize,
    required this.decimatedSize,
    required this.compressionRatio,
    required this.minY,
    required this.maxY,
  });

  @override
  String toString() {
    return 'DecimationMetrics(original: $originalSize, decimated: $decimatedSize, '
        'ratio: ${compressionRatio.toStringAsFixed(2)}x, '
        'range: $minY-$maxY)';
  }
}
