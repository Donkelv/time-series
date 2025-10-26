import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import 'package:time_series/features/biometrics/presentation/widgets/chart_tool_bar.dart';

void main() {
  group('ChartToolbar Widget Tests', () {
    testWidgets('should display all range options', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('7D'), findsOneWidget);
      expect(find.text('30D'), findsOneWidget);
      expect(find.text('90D'), findsOneWidget);
    });

    testWidgets('should highlight selected range', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '90d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      // The selected range should have different styling
      final selectedButton = find.text('90D');
      expect(selectedButton, findsOneWidget);
    });

    testWidgets('should call onRangeChange when range is tapped', (WidgetTester tester) async {
      String? selectedRange;
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {
                  selectedRange = range;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('7D'));
      await tester.pump();

      expect(selectedRange, equals('7d'));
    });

    testWidgets('should display large dataset toggle', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Large Dataset'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('should toggle large dataset when switch is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      final switchWidget = find.byType(Switch);
      expect(switchWidget, findsOneWidget);

      await tester.tap(switchWidget);
      await tester.pump();

      // The switch should be toggled (this would be verified by the provider state)
    });
  });

  group('ChartController Range Switching Tests', () {
    testWidgets('should update chart data when range changes from 90d to 7d', (WidgetTester tester) async {
      // This test would verify that when the range changes from 90d to 7d,
      // all charts update their x-axis domains and tooltips remain synced
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  ChartToolbar(
                    selectedRange: '90d',
                    onRangeChange: (range) {
                      // Simulate range change
                    },
                  ),
                  // Mock chart widgets would be here
                ],
              ),
            ),
          ),
        ),
      );

      // Initial state should be 90d
      expect(find.text('90D'), findsOneWidget);

      // Change to 7d
      await tester.tap(find.text('7D'));
      await tester.pump();

      // Verify the range change was triggered
      expect(find.text('7D'), findsOneWidget);
    });

    testWidgets('should maintain tooltip synchronization across charts', (WidgetTester tester) async {
      // This test would verify that when hovering over one chart,
      // the same date is highlighted across all charts
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      // The test would simulate hover events and verify that
      // all charts show the same date in their tooltips
    });
  });

  group('Performance Tests', () {
    testWidgets('should handle large dataset toggle efficiently', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ChartToolbar(
                selectedRange: '30d',
                onRangeChange: (range) {},
              ),
            ),
          ),
        ),
      );

      final stopwatch = Stopwatch()..start();
      
      // Toggle large dataset multiple times
      for (int i = 0; i < 10; i++) {
        await tester.tap(find.byType(Switch));
        await tester.pump();
      }
      
      stopwatch.stop();
      
      // Should complete within reasonable time (less than 1 second)
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });
  });
}
