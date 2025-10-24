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
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      canvasColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF1E1E1E)),
        titleTextStyle: TextStyle(
          color: Color(0xFF1E1E1E),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      textTheme: AppTextTheme.lightTextTheme,
      colorScheme: const ColorScheme.light(
        primary: TimeSeriesColors.cadmiumRed, // cadmiumRed
        onPrimary: Colors.white,
        secondary: Color(0xFF607D8B),
        surface: Colors.white,
        onSurface: Color(0xFF1E1E1E),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF2F3F5),
        selectedColor: const Color(0xFFE53935),
        labelStyle: const TextStyle(color: Color(0xFF1E1E1E)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE53935),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE53935)),
          foregroundColor: const Color(0xFFE53935),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      dialogBackgroundColor: Colors.white,
      dividerColor: const Color(0xFFDDDDDD),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
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
