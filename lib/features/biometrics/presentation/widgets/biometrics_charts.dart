import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import '../../../../core/theme/colors.dart';

class BiometricsChart extends ConsumerStatefulWidget {
  final String title;
  final String metric;

  const BiometricsChart({super.key, required this.title, required this.metric});

  @override
  ConsumerState<BiometricsChart> createState() => _BiometricsChartState();
}

class _BiometricsChartState extends ConsumerState<BiometricsChart> {
  bool showAvg = false;

  final List<Color> gradientColors = const [
     Color(0xffF23B4D), // base red-pink
     Color(0xffF56B6C), // lighter pinkish red
     Color(0xffF89B8E), // peach tone for fade
  ];

  @override
  Widget build(BuildContext context) {
    final chartState = ref.watch(chartControllerProvider);
    final spots = chartState.spots[widget.metric] ?? [];
    final hrvBands = chartState.hrvBands;
    final journalAnnotations = chartState.journalAnnotations;
    final hoverDate = chartState.hoverDate;

    if (spots.isEmpty) {
      return SizedBox(
        height: 200.h,
        child: const Center(child: Text("No data")),
      );
    }

    return Card(
      margin: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    if (chartState.isDecimated &&
                        chartState.decimationMetrics != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Decimated ${chartState.decimationMetrics!.compressionRatio.toStringAsFixed(1)}x',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 12.h),

            SizedBox(
              height: 400.h,
              child: LineChart(_buildMainData(spots, hrvBands, hoverDate)),
            ),

            if (journalAnnotations.isNotEmpty && widget.metric == 'hrv')
              _buildJournalAnnotations(context, journalAnnotations),
          ],
        ),
      ),
    );
  }

  /// --- Main Data Chart ---
  LineChartData _buildMainData(
    List<ChartSpot> spots,
    Map<String, List<ChartSpot>> hrvBands,
    DateTime? hoverDate,
  ) {
    return LineChartData(
      lineBarsData: _buildLineBars(spots, hrvBands, widget.metric),
      lineTouchData: _buildLineTouchData(spots, ref),
      titlesData: _buildTitlesData(spots, widget.metric),
      showingTooltipIndicators: _buildTooltipIndicators(spots, hoverDate),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine:
            (value) =>
                FlLine(color: Colors.grey.withOpacity(0.2), strokeWidth: 1),
        getDrawingVerticalLine:
            (value) =>
                FlLine(color: Colors.grey.withOpacity(0.2), strokeWidth: 1),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minY: 0,
    );
  }

  /// --- Build Lines ---
  List<LineChartBarData> _buildLineBars(
    List<ChartSpot> spots,
    Map<String, List<ChartSpot>> hrvBands,
    String metric,
  ) {
    final lineBars = <LineChartBarData>[];

    // Main line
    lineBars.add(
      LineChartBarData(
        spots: spots.map((s) => FlSpot(s.x, s.y)).toList(),
        isCurved: true,
        gradient: LinearGradient(colors: gradientColors),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: metric == 'hrv',
          gradient: LinearGradient(
            colors: gradientColors.map((c) => c.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    );

    // HRV bands (optional)
    if (metric == 'hrv' && hrvBands.isNotEmpty) {
      final meanSpots = hrvBands['mean'] ?? [];
      final upperSpots = hrvBands['upper'] ?? [];
      final lowerSpots = hrvBands['lower'] ?? [];

      if (meanSpots.isNotEmpty) {
        lineBars.add(
          LineChartBarData(
            spots: meanSpots.map((s) => FlSpot(s.x, s.y)).toList(),
            isCurved: true,
            color: TimeSeriesColors.cadmiumRed.withOpacity(0.6),
            barWidth: 1.5,
            dotData: const FlDotData(show: false),
          ),
        );
      }

      if (upperSpots.isNotEmpty && lowerSpots.isNotEmpty) {
        lineBars.addAll([
          LineChartBarData(
            spots: upperSpots.map((s) => FlSpot(s.x, s.y)).toList(),
            isCurved: true,
            color: TimeSeriesColors.cadmiumRed.withOpacity(0.3),
            barWidth: 1,
            dotData: const FlDotData(show: true),
          ),
          LineChartBarData(
            spots: lowerSpots.map((s) => FlSpot(s.x, s.y)).toList(),
            isCurved: true,
            color: TimeSeriesColors.cadmiumRed.withOpacity(0.3),
            barWidth: 1,
            dotData: const FlDotData(show: true),
          ),
        ]);
      }
    }

    return lineBars;
  }

  /// --- Line Touch (hover) ---
  LineTouchData _buildLineTouchData(List<ChartSpot> spots, WidgetRef ref) {
    return LineTouchData(
      enabled: true,
      touchCallback: (event, response) {
        if (response?.lineBarSpots?.isNotEmpty ?? false) {
          final idx = response!.lineBarSpots!.first.spotIndex.toInt();
          if (idx >= 0 && idx < spots.length) {
            ref
                .read(chartControllerProvider.notifier)
                .updateHoverDate(spots[idx].date);
          }
        }
      },
      getTouchedSpotIndicator: (barData, spotIndexes) {
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            FlLine(color: Colors.white, strokeWidth: 2),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: gradientColors.first,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
        tooltipRoundedRadius: 8,
        tooltipPadding: const EdgeInsets.all(8),
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((touchedSpot) {
            final spot = spots[touchedSpot.spotIndex];
            return LineTooltipItem(
              '${widget.metric.toUpperCase()}: ${_formatTooltipValue(spot.y, widget.metric)}\n'
              'Date: ${spot.date.day}/${spot.date.month}/${spot.date.year}',
              const TextStyle(color: Colors.white, fontSize: 12),
            );
          }).toList();
        },
      ),
    );
  }

  /// --- Titles ---
  FlTitlesData _buildTitlesData(List<ChartSpot> spots, String metric) {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 42,
          getTitlesWidget: (value, meta) {
            return Text(
              _formatYAxisValue(value, metric),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 2,
          reservedSize: 28,
          getTitlesWidget: (x, _) {
            final idx = x.toInt();
            if (idx >= 0 && idx < spots.length) {
              final date = spots[idx].date;
              return Text(
                "${date.day}/${date.month}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  /// --- Tooltip Indicators ---
  List<ShowingTooltipIndicators> _buildTooltipIndicators(
    List<ChartSpot> spots,
    DateTime? hoverDate,
  ) {
    if (hoverDate == null) return [];
    ChartSpot? closestSpot;
    double minDist = double.infinity;

    for (final s in spots) {
      final dist = (s.date.difference(hoverDate).inDays).abs();
      if (dist < minDist) {
        minDist = dist.toDouble();
        closestSpot = s;
      }
    }

    if (closestSpot == null) return [];
    return [
      ShowingTooltipIndicators([
        LineBarSpot(
          LineChartBarData(spots: spots.map((s) => FlSpot(s.x, s.y)).toList()),
          0,
          FlSpot(closestSpot.x, closestSpot.y),
        ),
      ]),
    ];
  }

  /// --- Journal Annotations ---
  Widget _buildJournalAnnotations(
    BuildContext context,
    List<JournalAnnotation> annotations,
  ) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: annotations.length,
        itemBuilder: (context, index) {
          final a = annotations[index];
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            child: Tooltip(
              message: 'Mood: ${a.mood}/5\n${a.note}',
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: _getMoodColor(a.mood),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.circle, size: 8, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  /// --- Helpers ---
  Color _getMoodColor(int mood) {
    switch (mood) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.lightGreen;
      case 5:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _formatYAxisValue(double value, String metric) {
    switch (metric) {
      case 'hrv':
        return value.toStringAsFixed(1);
      case 'rhr':
        return value.toInt().toString();
      case 'steps':
        return '${(value / 1000).toStringAsFixed(1)}k';
      default:
        return value.toStringAsFixed(1);
    }
  }

  String _formatTooltipValue(double value, String metric) {
    return _formatYAxisValue(value, metric);
  }
}
