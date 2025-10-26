import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------- MOCK CONTROLLER & STATE ----------------------

class ChartState {
  final String selectedRange;
  final bool isLargeDataset;
  ChartState({required this.selectedRange, this.isLargeDataset = false});

  ChartState copyWith({String? selectedRange, bool? isLargeDataset}) {
    return ChartState(
      selectedRange: selectedRange ?? this.selectedRange,
      isLargeDataset: isLargeDataset ?? this.isLargeDataset,
    );
  }
}

class ChartController extends StateNotifier<ChartState> {
  ChartController() : super(ChartState(selectedRange: '30d'));

  void updateRange(String range) =>
      state = state.copyWith(selectedRange: range);

  void toggleLargeDataset() =>
      state = state.copyWith(isLargeDataset: !state.isLargeDataset);
}

final chartControllerProvider =
    StateNotifierProvider<ChartController, ChartState>(
      (ref) => ChartController(),
    );

// ---------------------- MOCK COLOR PALETTE ----------------------

class TimeSeriesColors {
  static const cadmiumRed = Color(0xffF23B4D);
}

// ---------------------- MOCK BIOMETRICS CHART ----------------------

class BiometricsChart extends ConsumerWidget {
  const BiometricsChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartState = ref.watch(chartControllerProvider);

    // For testing, just show a Text widget that changes with selectedRange
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Range: ${chartState.selectedRange}', key: const Key('rangeText')),
        const SizedBox(height: 10),
        ChartToolbar(),
      ],
    );
  }
}

// ---------------------- CHART TOOLBAR ----------------------

class ChartToolbar extends ConsumerWidget {
  final String? selectedRangeOverride;
  final void Function(String)? onRangeChangeOverride;

  const ChartToolbar({
    super.key,
    this.selectedRangeOverride,
    this.onRangeChangeOverride,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartState = ref.watch(chartControllerProvider);
    final chartController = ref.read(chartControllerProvider.notifier);
    final ranges = ['7d', '30d', '90d'];

    final selectedRange = selectedRangeOverride ?? chartState.selectedRange;
    final onRangeChange = onRangeChangeOverride ?? chartController.updateRange;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: TimeSeriesColors.cadmiumRed),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children:
                ranges.map((range) {
                  final isSelected = range == selectedRange;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () => onRangeChange(range),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? TimeSeriesColors.cadmiumRed
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          range.toUpperCase(),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

// ---------------------- TESTS ----------------------

void main() {
  testWidgets('ChartToolbar displays and switches ranges correctly', (
    tester,
  ) async {
    String? selected;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: ChartToolbar(
              selectedRangeOverride: '30d',
              onRangeChangeOverride: (r) => selected = r,
            ),
          ),
        ),
      ),
    );

    expect(find.text('7D'), findsOneWidget);
    expect(find.text('30D'), findsOneWidget);
    expect(find.text('90D'), findsOneWidget);

    // Tap on 7D
    await tester.tap(find.text('7D'));
    await tester.pumpAndSettle();

    expect(selected, equals('7d'));
  });

  testWidgets('BiometricsChart updates when range changes', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: Scaffold(body: BiometricsChart())),
      ),
    );

    // Default range is 30d
    expect(find.text('Range: 30d'), findsOneWidget);

    // Tap on 7D button
    await tester.tap(find.text('7D'));
    await tester.pumpAndSettle();

    // Verify chart updated
    expect(find.text('Range: 7d'), findsOneWidget);

    // Tap on 90D button
    await tester.tap(find.text('90D'));
    await tester.pumpAndSettle();

    // Verify chart updated
    expect(find.text('Range: 90d'), findsOneWidget);
  });
}
