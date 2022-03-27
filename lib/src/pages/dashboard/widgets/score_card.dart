import 'package:flutter/material.dart';
import 'package:today_i_learned/src/config/app_colors.dart';
import 'package:today_i_learned/src/config/app_spacing.dart';
import 'package:today_i_learned/src/widgets/custom_text.dart';

class ScoreCard extends StatelessWidget {
  static const double _height = 100;
  static const double _width = 275;

  final String title;
  final String subtitle;

  const ScoreCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      padding: const EdgeInsets.only(right: AppSpacing.XL),
      decoration: BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.circular(AppSpacing.M),
        boxShadow: const [
          BoxShadow(
            blurRadius: AppSpacing.S,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText.headline1(title),
          const SizedBox(height: AppSpacing.L),
          CustomText.headline2(subtitle),
        ],
      ),
    );
  }
}
