

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import '../../../../core/theme/colors.dart';

class BiometricsChart extends ConsumerWidget {
  final String title;
  final String metric;

  const BiometricsChart({super.key, required this.title, required this.metric});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartState = ref.watch(chartControllerProvider);
    final spots = chartState.spots[metric] ?? [];

    if (spots.isEmpty) {
      return SizedBox(
        height: 200.h,
        child: const Center(child: Text("No data")),
      );
    }

    return Card(
      margin: EdgeInsets.only(top: 12.h),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8.h),
            SizedBox(
              height: 180.h,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots
                          .map((s) => FlSpot(s.x, s.y))
                          .toList(growable: false),
                      isCurved: true,
                      color: TimeSeriesColors.cadmiumRed,
                      barWidth: 2,
                      belowBarData: BarAreaData(
                        show: metric == 'hrv',
                        color: TimeSeriesColors.cadmiumRed.withOpacity(0.15),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchCallback: (event, response) {
                      if (response?.lineBarSpots != null &&
                          response!.lineBarSpots!.isNotEmpty) {
                        final idx =
                            response.lineBarSpots!.first.spotIndex.toInt();
                        final date = spots[idx].date;
                        ref
                            .read(chartControllerProvider.notifier)
                            .updateHoverDate(date);
                      }
                    },
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (x, _) {
                          final idx = x.toInt();
                          if (idx >= 0 && idx < spots.length) {
                            final date = spots[idx].date;
                            return Text(
                              "${date.day}/${date.month}",
                              style: TextStyle(fontSize: 10.sp),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
