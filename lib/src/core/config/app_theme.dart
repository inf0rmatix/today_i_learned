import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/config/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: AppColors.wintergreenDream,
      secondary: AppColors.sandyBrown,
      tertiary: AppColors.flax,
      error: AppColors.bittersweetShimmer,
      background: AppColors.olivine,
    ),
  );
}
