import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.blue,
      onPrimary: Colors.white,
      secondary: AppColors.emerald,
      onSecondary: Colors.white,
      tertiary: AppColors.darkGreen,
      onTertiary: Colors.white,
      background: AppColors.darkGreen,
      onBackground: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.lavender,
      onSurface: Colors.white,
    ),
  );
}
