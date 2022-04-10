import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/core.dart';

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
    return SizedBox(
      height: _height,
      width: _width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(right: AppSpacing.XL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText.headline1(title),
              const SizedBox(height: AppSpacing.L),
              CustomText.headline2(subtitle),
            ],
          ),
        ),
      ),
    );
  }
}
