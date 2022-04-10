import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:today_i_learned/src/core/config/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData.from(
    colorScheme: const ColorScheme.light(
      primary: AppColors.olivine,
      secondary: AppColors.sandyBrown,
      onSecondary: AppColors.seashell,
      tertiary: AppColors.flax,
      error: AppColors.bittersweetShimmer,
      background: AppColors.wintergreenDream,
      onBackground: AppColors.seashell,
      surface: AppColors.olivine,
    ),
    textTheme: Typography.whiteHelsinki,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: const CardTheme(elevation: 2),
    shadowColor: Colors.black,
    hintColor: AppColors.seashell,
    highlightColor: AppColors.seashell,
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: AppColors.seashell,
      prefixIconColor: AppColors.seashell,
      suffixIconColor: AppColors.seashell,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(
        color: AppColors.seashell,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.seashell,
        ),
      ),
    ),
  );
}
