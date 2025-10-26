import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/core/extensions/context_extensions.dart';
import 'package:time_series/features/biometrics/logic/chart_controller/chart_provider.dart';
import '../../../../core/theme/colors.dart';


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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: TimeSeriesColors.cadmiumRed),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children:
                  ranges.map((range) {
                    final isSelected = range == selectedRange;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: GestureDetector(
                        onTap: () => onRangeChange(range),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? TimeSeriesColors.cadmiumRed
                                    : context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            range.toUpperCase(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : Theme.of(context).colorScheme.onSurface,
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color:
                      chartState.isLargeDataset
                          ? TimeSeriesColors.cadmiumRed.withOpacity(0.1)
                          : context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.dataset),
                    const SizedBox(width: 4),
                    const Text('Large Dataset'),
                    Switch(
                      value: chartState.isLargeDataset,
                      onChanged: (_) => chartController.toggleLargeDataset(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// class ChartToolbar extends ConsumerWidget {
//   const ChartToolbar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final chartState = ref.watch(chartControllerProvider);
//     final chartController = ref.read(chartControllerProvider.notifier);
//     final ranges = ['7d', '30d', '90d'];

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 12.h),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: TimeSeriesColors.cadmiumRed),
//               borderRadius: BorderRadius.circular(20.r),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children:
//                   ranges.map((range) {
//                     final isSelected = range == chartState.selectedRange;
//                     return Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 6.w),
//                       child: GestureDetector(
//                         onTap: () => chartController.updateRange(range),
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 250),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 16.w,
//                             vertical: 8.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color:
//                                 isSelected
//                                     ? TimeSeriesColors.cadmiumRed
//                                     : context.colorScheme.surface,
//                             borderRadius: BorderRadius.circular(20.r),
//                             boxShadow: [
//                               if (isSelected)
//                                 BoxShadow(
//                                   color: TimeSeriesColors.cadmiumRed
//                                       .withOpacity(0.3),
//                                   blurRadius: 8,
//                                   spreadRadius: 1,
//                                 ),
//                             ],
//                           ),
//                           child: Text(
//                             range.toUpperCase(),
//                             style: Theme.of(
//                               context,
//                             ).textTheme.bodyMedium?.copyWith(
//                               color:
//                                   isSelected
//                                       ? Colors.white
//                                       : Theme.of(context).colorScheme.onSurface,
//                               fontWeight:
//                                   isSelected
//                                       ? FontWeight.bold
//                                       : FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ),
//           SizedBox(height: 8.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Large Dataset Toggle
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//                 decoration: BoxDecoration(
//                   color:
//                       chartState.isLargeDataset
//                           ? TimeSeriesColors.cadmiumRed.withOpacity(0.1)
//                           : context.colorScheme.surface,
//                   borderRadius: BorderRadius.circular(16.r),
//                   border: Border.all(
//                     color:
//                         chartState.isLargeDataset
//                             ? TimeSeriesColors.cadmiumRed
//                             : Colors.grey.withOpacity(0.3),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.dataset,
//                       size: 16.sp,
//                       color:
//                           chartState.isLargeDataset
//                               ? TimeSeriesColors.cadmiumRed
//                               : Colors.grey,
//                     ),
//                     SizedBox(width: 4.w),
//                     Text(
//                       'Large Dataset',
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         color:
//                             chartState.isLargeDataset
//                                 ? TimeSeriesColors.cadmiumRed
//                                 : Colors.grey,
//                         fontWeight:
//                             chartState.isLargeDataset
//                                 ? FontWeight.w600
//                                 : FontWeight.normal,
//                       ),
//                     ),
//                     SizedBox(width: 4.w),
//                     Switch(
//                       value: chartState.isLargeDataset,
//                       onChanged:
//                           (value) => chartController.toggleLargeDataset(),
//                       activeColor: TimeSeriesColors.cadmiumRed,
//                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
