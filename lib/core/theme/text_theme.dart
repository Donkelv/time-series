import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_series/core/theme/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme darkTextTheme = TextTheme(
    // H1
    headlineMedium: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 28.5.sp,
      // height: (40 / 32).sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w400,
      //fontVariations: [const FontVariation('wght', 400)],
    ),
    // Title1
    headlineLarge: GoogleFonts.inter(
      // fontFamily: 'TT-Norms',
      fontSize: 36.5.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w700,
      // fontVariations: [const FontVariation('wght', 500)],
    ),
    headlineSmall: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 20.5.sp,
      color: TimeSeriesColors.white,
      // fontWeight: FontWeight.w500,
      //fontVariations: [const FontVariation('wght', 500)],
    ),

    // Body
    titleMedium: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 24.5.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w700,
      //fontVariations: [const FontVariation('wght', 400)],
    ),
    // Title1-Bold
    titleLarge: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 30.5.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w700,
      //fontVariations: [const FontVariation('wght', 700)],
    ),
    titleSmall: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 20.5.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w700,
      //fontVariations: [const FontVariation('wght', 700)],
    ),

    // Title2-Bold
    labelLarge: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 20.sp,
      color: TimeSeriesColors.white,
      // fontWeight: FontWeight.w700,
      //fontVariations: [const FontVariation('wght', 700)],
    ),
    // Body2-Bold
    labelMedium: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 16.sp,
      color: TimeSeriesColors.white,
      // fontWeight: FontWeight.w400,
      //fontVariations: [const FontVariation('wght', 400)],
    ),
    // Body2
    labelSmall: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 14.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      //fontVariations: [const FontVariation('wght', 400)],
    ),
    // Headline-Bold
    bodyLarge: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 20.5.sp,
      color: TimeSeriesColors.white,
      // fontWeight: FontWeight.w700,
      //fontVariations: [const FontVariation('wght', 700)],
    ),
    // Headline
    bodyMedium: GoogleFonts.inter(
      //fontFamily: 'TT-Norms',
      fontSize: 16.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w500,
      //fontVariations: [const FontVariation('wght', 500)],
    ),
    // Body-Bold
    bodySmall: GoogleFonts.inter(
      // fontFamily: 'TT-Norms',
      fontSize: 14.sp,
      color: TimeSeriesColors.white,
      fontWeight: FontWeight.w500,
      //fontVariations: [const FontVariation('wght', 500)],
    ),
  );
}
