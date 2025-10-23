import 'package:flutter/material.dart';

class TimeSeriesColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  TimeSeriesColors._();

  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color primary = Color(0xFFF23B4D);

  static const Color grey1 = Color(0xFFAFB4BB);
  static const Color grey2 = Color(0xFF8F949B);
  static const Color grey3 = Color(0xff898989);
  static const Color grey4 = Color(0xffE7E9EF);
  static const Color grey5 = Color(0xFF676C72);
  static const Color grey6 = Color(0xFF24272C);
  static const Color grey7 = Color(0xFF212427);
  static const Color grey8 = Color(0xFF212327);

  static const Color grey9 = Color(0xff262A2F);
  static const Color grey10 = Color(0xFF35E6063);
  static const Color grey11 = Color(0xFF2E3338);
  static const Color grey600 = Color(0xFF848A94);

  static const Color vampireBlack = Color(0xff161A1F);
  static const Color vampireBlack500 = Color(0x7F363A40);
  static const Color vampireBlack800 = Color(0xFF363A40);
  static const Color vampireBlack400 = Color(0xFFAFB4BB);
  static const Color vampireBlack200 = Color(0xFF262A2F);
  static const Color vampireBlack300 = Color(0xFFd3d8df);

  static const Color black2 = Color(0xff25282D);
  static const Color black3 = Color(0xff54595F);
  static const Color black4 = Color(0xff363A40);

  static const Color navyBlue1 = Color(0xff0E1F33);

  static const Color pink1 = Color(0x7FF19298);
  static const Color pink2 = Color(0xffFFEDF5);
  static const Color pink3 = Color(0xffffCDD1);
  static const Color purple1 = Color(0xFF5E2F65);

  static const Color red1 = Color(0xffF23B4D);
  static const Color cadmiumRed = Color(0xffF23B4D);
  static const Color red2 = Color(0xfff23A4D);
  static const Color red3 = Color(0xffE76670);
  static const Color red4 = Color(0xFFE40E20);
  static const Color red5 = Color(0xFFe84553);

  static const Color yellow1 = Color(0xFFEDB82E);
  static const Color yellow2 = Color(0xFFF9C537);
  static const Color yellow3 = Color(0xffF8BC26);
  static const Color yellow4 = Color(0xFFF7AF22);

  static const Color blue3 = Color(0xFF0080F0);

  static const Color green1 = Color(0xFF73E88D);
  static const Color green2 = Color(0xFF14C36E);
  static const Color green3 = Color(0x3314C36E);
  static const Color green4 = Color(0xFF07C267);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
