import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:time_series/core/theme/colors.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.all(12.r),
        filled: true,
        fillColor: TimeSeriesColors.white.withOpacity(0.15000000596046448),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        helperStyle: GoogleFonts.inter(
          color: TimeSeriesColors.white,
          // fontFamily: "TT-Norms",
          fontSize: 10.sp,
          // height: (26 / 12).sp,
          // fontVariations: [const FontVariation('wght', 400)],
        ),
        counterStyle: GoogleFonts.inter(
          color: TimeSeriesColors.white,
          fontSize: 10.sp,
          //fontFamily: "TT-Norms",
          // height: (26 / 12).sp,
          //fontVariations: [const FontVariation('wght', 400)],
        ),
        labelStyle: GoogleFonts.inter(
          color: TimeSeriesColors.white,
          fontSize: 14.sp,
          //fontFamily: "TT-Norms",
          // height: (26 / 12).sp,
          // fontVariations: [const FontVariation('wght', 400)],
        ),
        floatingLabelStyle: GoogleFonts.inter(
          color: TimeSeriesColors.vampireBlack,
          fontSize: 10.sp,
          // fontFamily: "TT-Norms",
          // fontVariations: [const FontVariation('wght', 400)],
        ),
        alignLabelWithHint: false,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintStyle: GoogleFonts.inter(
          color: TimeSeriesColors.white,
          fontSize: 16.sp,
          // fontFamily: "TT-Norms",
          // fontVariations: [const FontVariation('wght', 400)],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: TimeSeriesColors.white.withOpacity(0.15),
          ),
        ),
        prefixStyle: GoogleFonts.inter(
          color: TimeSeriesColors.white,
          fontSize: 16.sp,
          // fontFamily: "TT-Norms",
          // fontVariations: [const FontVariation('wght', 400)],
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: TimeSeriesColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: TimeSeriesColors.white),
        ),
      );
}
