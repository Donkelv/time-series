import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_controller_state.dart';
import '../../../../core/theme/colors.dart';

class PerformanceMonitor extends ConsumerWidget {
  const PerformanceMonitor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartState = ref.watch(chartControllerProvider);
    final isLargeDataSet = chartState.isLargeDataset;
    final metrics = chartState.decimationMetrics;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin:
          isLargeDataSet == false || metrics == null
              ? null
              : EdgeInsets.all(8.w),
      padding:
          isLargeDataSet == false || metrics == null
              ? null
              : EdgeInsets.all(12.w),
      decoration:
          isLargeDataSet == false || metrics == null
              ? null
              : BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
      child:
          isLargeDataSet == false || metrics == null
              ? const SizedBox.shrink()
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.speed, size: 16.sp, color: Colors.blue),
                      SizedBox(width: 4.w),
                      Text(
                        'Performance Metrics',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  _buildMetricRow(
                    'Original Points',
                    metrics.originalSize.toString(),
                  ),
                  _buildMetricRow(
                    'Decimated Points',
                    metrics.decimatedSize.toString(),
                  ),
                  _buildMetricRow(
                    'Compression Ratio',
                    '${metrics.compressionRatio.toStringAsFixed(1)}x',
                  ),
                  _buildMetricRow(
                    'Data Range',
                    '${metrics.minY.toStringAsFixed(1)} - ${metrics.maxY.toStringAsFixed(1)}',
                  ),
                  if (chartState.isDecimated)
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'Optimized for smooth rendering',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceNote extends StatelessWidget {
  const PerformanceNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Note',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Method: LTTB (Largest Triangle Three Buckets) algorithm for downsampling\n'
            'Metrics: Maintains <16ms per frame for smooth 60fps rendering\n'
            'Optimizations: Adaptive decimation based on zoom level, preserved min/max values',
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
