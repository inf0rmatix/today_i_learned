import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/core.dart';

class LastLearned extends StatelessWidget {
  final List<LearningModel> learnings;

  const LastLearned({
    Key? key,
    required this.learnings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.XL),
      decoration: BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.circular(AppSpacing.M),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText.headline1(
              LocaleKeys.dashboard_last_learned_title.translate()),
          const SizedBox(height: AppSpacing.L),
          ListView.separated(
            shrinkWrap: true,
            itemCount: learnings.length,
            itemBuilder: (context, index) {
              var learning = learnings[index];

              return Container(
                padding: const EdgeInsets.all(AppSpacing.M),
                decoration: BoxDecoration(
                  color: AppColors.emerald,
                  borderRadius: BorderRadius.circular(AppSpacing.M),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.headline3(learning.title),
                    const SizedBox(height: AppSpacing.S),
                    CustomText.subtitle(
                        learning.created.formatWeekdayDate(context.locale)),
                    const SizedBox(height: AppSpacing.M),
                    CustomText.headline4(learning.description),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.M),
          ),
        ],
      ),
    );
  }
}
