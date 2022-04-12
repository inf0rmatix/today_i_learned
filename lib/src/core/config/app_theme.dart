import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:today_i_learned/src/core/config/app_alpha.dart';
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
      surface: AppColors.greenSheen,
    ),
    textTheme: Typography.whiteHelsinki,
  ).copyWith(
    iconTheme: const IconThemeData(
      color: AppColors.seashell,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    cardTheme: const CardTheme(elevation: 2),
    shadowColor: Colors.black,
    hintColor: AppColors.seashell,
    splashColor: AppColors.seashell.withAlpha(AppAlpha.a50),
    highlightColor: AppColors.seashell.withAlpha(AppAlpha.a50),
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
