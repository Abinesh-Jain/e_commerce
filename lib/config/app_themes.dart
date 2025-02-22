import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData light = ThemeData.light().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.coralRed,
      extendedTextStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.coralRed),
        maximumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(
          color: AppColors.coralRed,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.coralRed,
        minimumSize: const Size(double.infinity, 48),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith();
}
