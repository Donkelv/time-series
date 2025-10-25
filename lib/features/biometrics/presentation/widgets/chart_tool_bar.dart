import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_series/core/extensions/context_extensions.dart';
import '../../../../core/theme/colors.dart';

class ChartToolbar extends StatelessWidget {
  final String selectedRange;
  final ValueChanged<String> onRangeChange;

  const ChartToolbar({
    super.key,
    required this.selectedRange,
    required this.onRangeChange,
  });

  @override
  Widget build(BuildContext context) {
    final ranges = ['7d', '30d', '90d'];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: TimeSeriesColors.cadmiumRed.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                      ],
                    ),
                    child: Text(
                      range.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            isSelected
                                ? Colors.white
                                : Theme.of(context).colorScheme.onSurface,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
