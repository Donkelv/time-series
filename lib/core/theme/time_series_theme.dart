import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_series/core/theme/button_theme.dart';

import 'package:time_series/core/theme/text_theme.dart';

import 'colors.dart';

class TimeSeriesTheme {
  static ThemeData getLightThemeData(BuildContext context) {
    return _lightThemeData(context);
  }

  static ThemeData getDarkThemeData(BuildContext context) {
    return _darkThemeData(context);
  }

  static ThemeData _lightThemeData(BuildContext context) {
    return ThemeData(
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: TimeSeriesColors.vampireBlack,
        iconTheme: IconThemeData(color: TimeSeriesColors.vampireBlack),
      ),
      chipTheme: Theme.of(context).chipTheme.copyWith(
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: TimeSeriesColors.vampireBlack400,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        selectedColor: TimeSeriesColors.cadmiumRed,
        backgroundColor: TimeSeriesColors.vampireBlack500,
      ),
      canvasColor: TimeSeriesColors.grey1,
      elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: AppButtonTheme.lightOutlinedButtonTheme,
      dialogBackgroundColor: TimeSeriesColors.vampireBlack,
      dropdownMenuTheme: Theme.of(context).dropdownMenuTheme.copyWith(
        menuStyle: MenuStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16.w),
          ),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return TimeSeriesColors.grey1;
            } else {
              return TimeSeriesColors.grey1;
            }
          }),
        ),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(TimeSeriesColors.vampireBlack300),
        trackColor: WidgetStateProperty.all(TimeSeriesColors.vampireBlack300),
        trackBorderColor: WidgetStateProperty.all(
          TimeSeriesColors.vampireBlack300,
        ),
        thickness: WidgetStateProperty.all(5),
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(true),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return TimeSeriesColors.grey5.withOpacity(.5);
          }
          if (states.contains(WidgetState.selected)) {
            return TimeSeriesColors.cadmiumRed;
          }
          return TimeSeriesColors.grey3;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              width: 1.0,
              color: TimeSeriesColors.grey5.withOpacity(.5),
            );
          }
          if (states.contains(WidgetState.selected)) {
            return BorderSide(width: 1.0, color: TimeSeriesColors.grey3);
          }
          return BorderSide(width: 1.0, color: TimeSeriesColors.grey3);
        }),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return TimeSeriesColors.cadmiumRed;
          }
          return null;
        }),
      ),
      bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
        backgroundColor: TimeSeriesColors.vampireBlack,
        modalElevation: 0.0,
        showDragHandle: true,
      ),
      scaffoldBackgroundColor: TimeSeriesColors.vampireBlack,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      platform: TargetPlatform.iOS,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData _darkThemeData(BuildContext context) {
    return ThemeData(
      textTheme: AppTextTheme.darkTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: TimeSeriesColors.vampireBlack,
        iconTheme: IconThemeData(color: TimeSeriesColors.vampireBlack),
      ),
      chipTheme: Theme.of(context).chipTheme.copyWith(
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: TimeSeriesColors.vampireBlack400,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        selectedColor: TimeSeriesColors.cadmiumRed,
        backgroundColor: TimeSeriesColors.vampireBlack500,
      ),
      dialogBackgroundColor: TimeSeriesColors.vampireBlack,
      canvasColor: TimeSeriesColors.grey1,
      elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: AppButtonTheme.lightOutlinedButtonTheme,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return TimeSeriesColors.grey5.withOpacity(.5);
          }
          if (states.contains(WidgetState.selected)) {
            return TimeSeriesColors.cadmiumRed;
          }
          return TimeSeriesColors.grey3;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              width: 1.0,
              color: TimeSeriesColors.grey5.withOpacity(.5),
            );
          }
          if (states.contains(WidgetState.selected)) {
            return BorderSide(width: 1.0, color: TimeSeriesColors.grey3);
          }
          return BorderSide(width: 1.0, color: TimeSeriesColors.grey3);
        }),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return TimeSeriesColors.cadmiumRed;
          }
          return null;
        }),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(TimeSeriesColors.vampireBlack300),
        trackColor: WidgetStateProperty.all(TimeSeriesColors.vampireBlack300),
        trackBorderColor: WidgetStateProperty.all(
          TimeSeriesColors.vampireBlack300,
        ),
        thickness: WidgetStateProperty.all(5),
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(true),
      ),
      dropdownMenuTheme: Theme.of(context).dropdownMenuTheme.copyWith(
        menuStyle: MenuStyle(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16.w),
          ),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return TimeSeriesColors.grey1;
            } else {
              return TimeSeriesColors.grey1;
            }
          }),
        ),
      ),
      bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
        backgroundColor: TimeSeriesColors.vampireBlack,
        modalElevation: 0.0,
        showDragHandle: true,
      ),
      scaffoldBackgroundColor: TimeSeriesColors.vampireBlack,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      platform: TargetPlatform.iOS,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
