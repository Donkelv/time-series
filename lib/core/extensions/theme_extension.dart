import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ElevatedButtonThemeData get buttonTheme => Theme.of(this).elevatedButtonTheme;
  OutlinedButtonThemeData get outlinedButton =>
      Theme.of(this).outlinedButtonTheme;
  InputDecorationTheme get textFieldTheme =>
      Theme.of(this).inputDecorationTheme;
  TabBarThemeData get tabBarTheme => Theme.of(this).tabBarTheme;
  ChipThemeData get chipTheme => Theme.of(this).chipTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  BottomNavigationBarThemeData get bottomNavBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;
}
