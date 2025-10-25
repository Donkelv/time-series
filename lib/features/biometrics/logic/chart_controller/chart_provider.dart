import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/logic/biometrics/biometrics_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_notifier.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import 'package:time_series/features/biometrics/logic/journal/journal_provider.dart';

final combinedChartDataProvider = Provider.autoDispose((ref) {
  final biometricsState = ref.watch(getBiometricsDataProvider);
  final journalState = ref.watch(journalProvider);

  return biometricsState.whenOrNull(
    successful: (biometrics) {
      return journalState.whenOrNull(
        successful: (journal) {
          return {'biometrics': biometrics, 'journal': journal};
        },
      );
    },
  );
});

final getChartSpotsProvider = Provider<GetChartSpots>((ref) {
  return GetChartSpots();
});

final chartControllerProvider =
    StateNotifierProvider<ChartController, ChartState>((ref) {
      return ChartController(ref);
    });



class GetChartSpots {
  Future<Map<String, List<ChartSpot>>> generate(
    List<BiometricsModel> entries,
    List<JournalModel> journals,
    String range,
  ) async {
    print("\n🧠 [GetChartSpots] Starting chart data generation...");
    print("📊 Total biometrics entries: ${entries.length}");
    print("📘 Total journal entries: ${journals.length}");
    print("📅 Selected range: $range");

    // Determine cutoff based on selected range
    final now = DateTime.now();
    final cutoff = switch (range) {
      '7d' => now.subtract(const Duration(days: 7)),
      '30d' => now.subtract(const Duration(days: 30)),
      _ => now.subtract(const Duration(days: 90)),
    };
    print("🕐 Cutoff date: $cutoff");

    // Helper to safely parse date
    DateTime? parseDate(String? rawDate) {
      if (rawDate == null || rawDate.isEmpty) {
        print("⚠️ Skipped entry with null/empty date");
        return null;
      }
      try {
        return DateTime.parse(rawDate);
      } catch (e) {
        print("❌ Failed to parse date '$rawDate': $e");
        return null;
      }
    }

    // Filter valid entries (only those after cutoff)
    final filtered =
        entries.where((e) {
          final date = parseDate(e.date);
          if (date == null) return false;
          return date.isAfter(cutoff) || date.isAtSameMomentAs(cutoff);
        }).toList();

    print("✅ Entries after filtering: ${filtered.length}");

    // Fallback if no entries after cutoff
    final usedEntries = filtered.isEmpty ? entries : filtered;
    if (filtered.isEmpty) {
      print("⚠️ No entries within range — falling back to all available data.");
    }

    // Prepare chart points
    final hrvSpots = <ChartSpot>[];
    final rhrSpots = <ChartSpot>[];
    final stepSpots = <ChartSpot>[];

    double? lastHrv, lastRhr, lastSteps;

    for (int i = 0; i < usedEntries.length; i++) {
      final e = usedEntries[i];
      final date = parseDate(e.date);

      if (date == null) {
        print("⚠️ Skipping entry with invalid date at index $i");
        continue;
      }

      final hrv = (e.hrv ?? lastHrv ?? 0).toDouble();
      final rhr = (e.rhr ?? lastRhr ?? 0).toDouble();
      final steps = (e.steps ?? lastSteps ?? 0).toDouble();

      hrvSpots.add(ChartSpot(i.toDouble(), hrv, date));
      rhrSpots.add(ChartSpot(i.toDouble(), rhr, date));
      stepSpots.add(ChartSpot(i.toDouble(), steps, date));

      lastHrv = hrv;
      lastRhr = rhr;
      lastSteps = steps;
    }

    print("📈 Generated spots summary:");
    print("   • HRV   → ${hrvSpots.length} points");
    print("   • RHR   → ${rhrSpots.length} points");
    print("   • Steps → ${stepSpots.length} points");

    if (hrvSpots.isEmpty && rhrSpots.isEmpty && stepSpots.isEmpty) {
      print("🚨 No chart data generated — check mock dates or entry fields.");
    } else {
      print("✅ Chart data generation completed successfully!");
    }

    return {'hrv': hrvSpots, 'rhr': rhrSpots, 'steps': stepSpots};
  }
}
