import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';

class ChartController extends StateNotifier<ChartState> {
  ChartController(this._ref) : super(ChartState.initial());

  final Ref _ref;

  void updateRange(String newRange) {
    state = state.copyWith(selectedRange: newRange);
  }

  void updateHoverDate(DateTime? date) {
    state = state.copyWith(hoverDate: date);
  }

  Future<void> generateSpots({
    required List<BiometricsModel> entries,
    required List<JournalModel> journals,
  }) async {
    debugPrint('Generating spots for range: ${state.selectedRange}');
    print('Entries count: ${entries.length}, Journals count: ${journals.length}');
    final spotsMap = await _ref
        .read(getChartSpotsProvider)
        .generate(entries, journals, state.selectedRange);

    state = state.copyWith(spots: spotsMap);
  }
}
