import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/logic/biometrics/biometrics_provider.dart';
import 'package:time_series/features/biometrics/logic/biometrics/biometrics_state.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/data_decimator.dart'
    hide DecimationMetrics;
import 'package:time_series/features/biometrics/logic/journal/journal_provider.dart';
import 'package:time_series/features/biometrics/logic/journal/journal_state.dart';
import 'package:flutter/foundation.dart';

class ChartController extends StateNotifier<ChartState> {
  ChartController(this._ref) : super(ChartState.initial());

  final Ref _ref;
  static const int maxPointsForSmoothRendering = 1000;

  /// Called when user taps a range (7D, 30D, 90D)
  Future<void> updateRange(String newRange) async {
    if (state.selectedRange == newRange) return;

    state = state.copyWith(selectedRange: newRange);
    debugPrint('📅 Range updated to $newRange — regenerating chart data...');

    await generateSpots(
      entries: _ref.read(getBiometricsDataProvider).data ?? [],
      journals: _ref.read(journalProvider).data ?? [],
    );
  }

  void updateHoverDate(DateTime? date) {
    state = state.copyWith(hoverDate: date);
  }

  Future<void> toggleLargeDataset() async {
    state = state.copyWith(isLargeDataset: !state.isLargeDataset);
    debugPrint('📊 Toggled Large Dataset: ${state.isLargeDataset}');
    await generateSpots(
      entries: _ref.read(getBiometricsDataProvider).data ?? [],
      journals: _ref.read(journalProvider).data ?? [],
    );
  }

  /// Generates chart data (spots, HRV bands, journal annotations)
  Future<void> generateSpots({
    required List<BiometricsModel> entries,
    required List<JournalModel> journals,
  }) async {
    final now = DateTime.now();
    final range = state.selectedRange;
    final days =
        range == '7d'
            ? 7
            : range == '30d'
            ? 30
            : 90;
    final cutoff = now.subtract(Duration(days: days));

    debugPrint('🔧 Generating spots for range: $range (cutoff: $cutoff)');
    debugPrint('🧾 Entries: ${entries.length}, Journals: ${journals.length}');

    final filteredEntries = filterBiometricEntriesForRange(
      entries,
      state.selectedRange,
    );

    // Generate base spots from the filtered entries
    final spotsMap = await _ref
        .read(getChartSpotsProvider)
        .generate(filteredEntries, journals, range);

    // Calculate HRV bands and journal annotations
    final hrvBands = _calculateHrvBands(spotsMap['hrv'] ?? []);
    final journalAnnotations = _generateJournalAnnotations(
      journals,
      spotsMap['hrv'] ?? [],
    );

    // Apply decimation (if toggled on)
    final decimatedSpots = _applyDecimation(spotsMap);
    final decimationMetrics = _calculateDecimationMetrics(
      spotsMap,
      decimatedSpots,
    );

    // Update state
    state = state.copyWith(
      spots: decimatedSpots,
      hrvBands: hrvBands,
      journalAnnotations: journalAnnotations,
      isDecimated: decimatedSpots != spotsMap,
      decimationMetrics: decimationMetrics,
    );

    debugPrint(
      '🎯 Chart data ready → Range: $range | Points: ${decimatedSpots["hrv"]?.length ?? 0}',
    );
  }

  // --- Helpers ---

  Map<String, List<ChartSpot>> _applyDecimation(
    Map<String, List<ChartSpot>> spotsMap,
  ) {
    if (!state.isLargeDataset) return spotsMap;

    final decimatedSpots = <String, List<ChartSpot>>{};
    for (final entry in spotsMap.entries) {
      final spots = entry.value;
      decimatedSpots[entry.key] =
          spots.length > maxPointsForSmoothRendering
              ? DataDecimator.lttbDownsample(spots, maxPointsForSmoothRendering)
              : spots;
    }
    return decimatedSpots;
  }

  Map<String, List<ChartSpot>> _calculateHrvBands(List<ChartSpot> hrvSpots) {
    if (hrvSpots.length < 7) return {};
    final rollingMean = <ChartSpot>[];
    final upperBand = <ChartSpot>[];
    final lowerBand = <ChartSpot>[];

    for (int i = 6; i < hrvSpots.length; i++) {
      final window = hrvSpots.sublist(i - 6, i + 1);
      final mean = window.map((e) => e.y).reduce((a, b) => a + b) / 7;
      final variance =
          window.map((e) => pow(e.y - mean, 2)).reduce((a, b) => a + b) / 7;
      final stdDev = sqrt(variance);
      final currentSpot = hrvSpots[i];
      rollingMean.add(ChartSpot(currentSpot.x, mean, currentSpot.date));
      upperBand.add(ChartSpot(currentSpot.x, mean + stdDev, currentSpot.date));
      lowerBand.add(ChartSpot(currentSpot.x, mean - stdDev, currentSpot.date));
    }

    return {'mean': rollingMean, 'upper': upperBand, 'lower': lowerBand};
  }

  List<JournalAnnotation> _generateJournalAnnotations(
    List<JournalModel> journals,
    List<ChartSpot> hrvSpots,
  ) {
    final annotations = <JournalAnnotation>[];
    for (final journal in journals) {
      try {
        final journalDate = DateTime.parse(journal.date);
        ChartSpot? closestSpot;
        double minDistance = double.infinity;

        for (final spot in hrvSpots) {
          final distance = (spot.date.difference(journalDate).inDays).abs();
          if (distance < minDistance) {
            minDistance = distance.toDouble();
            closestSpot = spot;
          }
        }

        if (closestSpot != null) {
          annotations.add(
            JournalAnnotation(
              date: journalDate,
              mood: journal.mood ?? 0,
              note: journal.note ?? '',
              x: closestSpot.x,
            ),
          );
        }
      } catch (e) {
        debugPrint('⚠️ Skipped invalid journal date: ${journal.date}');
      }
    }
    return annotations;
  }

  DecimationMetrics? _calculateDecimationMetrics(
    Map<String, List<ChartSpot>> original,
    Map<String, List<ChartSpot>> decimated,
  ) {
    if (identical(original, decimated)) return null;
    final hrvOriginal = original['hrv'] ?? [];
    final hrvDecimated = decimated['hrv'] ?? [];

    if (hrvOriginal.isEmpty || hrvDecimated.isEmpty) return null;

    return DecimationMetrics(
      originalSize: hrvOriginal.length,
      decimatedSize: hrvDecimated.length,
      compressionRatio: hrvOriginal.length / hrvDecimated.length,
      minY: hrvDecimated.map((e) => e.y).reduce(min),
      maxY: hrvDecimated.map((e) => e.y).reduce(max),
    );
  }

  List<BiometricsModel> filterBiometricEntriesForRange(
    List<BiometricsModel> entries,
    String range,
  ) {
    final now = DateTime.now();
    final rangeDays = switch (range) {
      '7d' => 7,
      '30d' => 30,
      '90d' => 90,
      _ => 30,
    };
    final cutoff = now.subtract(Duration(days: rangeDays));

    final filtered =
        entries.where((entry) {
          try {
            final entryDate = DateTime.parse(entry.date);
            return entryDate.isAfter(cutoff) && entryDate.isBefore(now);
          } catch (e) {
            debugPrint('⚠️ Invalid date format in entry: ${entry.date}');
            return false;
          }
        }).toList();

    debugPrint('''
🧠 Filtering biometrics data:
• Selected range: $range ($rangeDays days)
• Cutoff: ${cutoff.toIso8601String()}
• Total entries: ${entries.length}
• ✅ Filtered entries kept: ${filtered.length}
''');

    return filtered;
  }
}

// class ChartController extends StateNotifier<ChartState> {
//   ChartController(this._ref) : super(ChartState.initial());

//   final Ref _ref;
//   static const int maxPointsForSmoothRendering = 1000;

//   void updateRange(String newRange) {
//     state = state.copyWith(selectedRange: newRange);
//   }

//   void updateHoverDate(DateTime? date) {
//     state = state.copyWith(hoverDate: date);
//   }

//   void toggleLargeDataset() {
//     state = state.copyWith(isLargeDataset: !state.isLargeDataset);

//     generateSpots(
//       entries: _ref.read(getBiometricsDataProvider).data ?? [],
//       journals: _ref.read(journalProvider).data ?? [],
//     );
//   }

//   Future<void> generateSpots({
//     required List<BiometricsModel> entries,
//     required List<JournalModel> journals,
//   }) async {
//     debugPrint('Generating spots for range: ${state.selectedRange}');
//     print(
//       'Entries count: ${entries.length}, Journals count: ${journals.length}',
//     );

//     final spotsMap = await _ref
//         .read(getChartSpotsProvider)
//         .generate(entries, journals, state.selectedRange);

//     // Calculate HRV bands (7-day rolling mean ±1σ)
//     final hrvBands = _calculateHrvBands(spotsMap['hrv'] ?? []);

//     // Generate journal annotations
//     final journalAnnotations = _generateJournalAnnotations(
//       journals,
//       spotsMap['hrv'] ?? [],
//     );

//     // Apply decimation if needed
//     final decimatedSpots = _applyDecimation(spotsMap);
//     final decimationMetrics = _calculateDecimationMetrics(
//       spotsMap,
//       decimatedSpots,
//     );

//     debugPrint('Spots generated for range: ${state.selectedRange}');
//     debugPrint('Decimated: ${decimatedSpots != spotsMap}');
//     debugPrint('Decimation metrics: $decimationMetrics');
//     print('Spots generated $decimatedSpots');

//     state = state.copyWith(
//       spots: decimatedSpots,
//       hrvBands: hrvBands,
//       journalAnnotations: journalAnnotations,
//       isDecimated: decimatedSpots != spotsMap,
//       decimationMetrics: decimationMetrics,
//     );
//   }

//   Map<String, List<ChartSpot>> _applyDecimation(
//     Map<String, List<ChartSpot>> spotsMap,
//   ) {
//     if (!state.isLargeDataset) return spotsMap;

//     final decimatedSpots = <String, List<ChartSpot>>{};

//     for (final entry in spotsMap.entries) {
//       final spots = entry.value;
//       if (spots.length > maxPointsForSmoothRendering) {
//         decimatedSpots[entry.key] = DataDecimator.lttbDownsample(
//           spots,
//           maxPointsForSmoothRendering,
//         );
//       } else {
//         decimatedSpots[entry.key] = spots;
//       }
//     }

//     return decimatedSpots;
//   }

//   Map<String, List<ChartSpot>> _calculateHrvBands(List<ChartSpot> hrvSpots) {
//     if (hrvSpots.length < 7) return {};

//     final rollingMean = <ChartSpot>[];
//     final upperBand = <ChartSpot>[];
//     final lowerBand = <ChartSpot>[];

//     for (int i = 6; i < hrvSpots.length; i++) {
//       final window = hrvSpots.sublist(i - 6, i + 1);
//       final mean =
//           window.map((e) => e.y).reduce((a, b) => a + b) / window.length;
//       final variance =
//           window.map((e) => pow(e.y - mean, 2)).reduce((a, b) => a + b) /
//           window.length;
//       final stdDev = sqrt(variance);

//       final currentSpot = hrvSpots[i];
//       rollingMean.add(ChartSpot(currentSpot.x, mean, currentSpot.date));
//       upperBand.add(ChartSpot(currentSpot.x, mean + stdDev, currentSpot.date));
//       lowerBand.add(ChartSpot(currentSpot.x, mean - stdDev, currentSpot.date));
//     }

//     return {'mean': rollingMean, 'upper': upperBand, 'lower': lowerBand};
//   }

//   List<JournalAnnotation> _generateJournalAnnotations(
//     List<JournalModel> journals,
//     List<ChartSpot> hrvSpots,
//   ) {
//     final annotations = <JournalAnnotation>[];

//     for (final journal in journals) {
//       final journalDate = DateTime.parse(journal.date);

//       // Find the closest HRV spot for positioning
//       ChartSpot? closestSpot;
//       double minDistance = double.infinity;

//       for (final spot in hrvSpots) {
//         final distance = (spot.date.difference(journalDate).inDays).abs();
//         if (distance < minDistance) {
//           minDistance = distance.toDouble();
//           closestSpot = spot;
//         }
//       }

//       if (closestSpot != null) {
//         annotations.add(
//           JournalAnnotation(
//             date: journalDate,
//             mood: journal.mood ?? 0,
//             note: journal.note ?? '',
//             x: closestSpot.x,
//           ),
//         );
//       }
//     }

//     return annotations;
//   }

//   DecimationMetrics? _calculateDecimationMetrics(
//     Map<String, List<ChartSpot>> original,
//     Map<String, List<ChartSpot>> decimated,
//   ) {
//     if (original == decimated) return null;

//     final originalHrv = original['hrv'] ?? [];
//     final decimatedHrv = decimated['hrv'] ?? [];

//     if (originalHrv.isEmpty || decimatedHrv.isEmpty) return null;

//     return DecimationMetrics(
//       originalSize: originalHrv.length,
//       decimatedSize: decimatedHrv.length,
//       compressionRatio: originalHrv.length / decimatedHrv.length,
//       minY: decimatedHrv.map((e) => e.y).reduce((a, b) => a < b ? a : b),
//       maxY: decimatedHrv.map((e) => e.y).reduce((a, b) => a > b ? a : b),
//     );
//   }
// }
