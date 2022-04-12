import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/core.dart';

class GoalListElement extends StatelessWidget {
  final GoalModel goal;

  const GoalListElement({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final learningProgress = goal.learnings / goal.requiredLearnings;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.M),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.sports_score_rounded,
                size: AppIconSize.L,
              ),
              title: CustomText.headline1(goal.title),
            ),
            ListTile(
              leading: const Icon(Icons.event_rounded),
              title: Text(goal.deadline.formatWeekdayDate(context.locale)),
            ),
            ListTile(
              leading: const Icon(Icons.tag_rounded),
              title: Text('${goal.requiredLearnings} learnings'),
            ),
            if (goal.requiredDifficulty != GoalModel.noDifficultyRequirementValue)
              ListTile(
                leading: const Icon(Icons.construction_rounded),
                title: Text('${goal.requiredDifficulty} minimum difficulty'),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      LinearProgressIndicator(
                        minHeight: AppSpacing.XL,
                        value: learningProgress,
                      ),
                      Positioned(
                        left: AppSpacing.zero,
                        right: AppSpacing.zero,
                        child: Center(
                          child: CustomText.headline3('${goal.learnings} of ${goal.requiredLearnings} learnings'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Stack(
            //         children: [
            //           LinearProgressIndicator(
            //             minHeight: AppSpacing.XL,
            //             value: timeProgress,
            //           ),
            //           Positioned(
            //             left: AppSpacing.zero,
            //             right: AppSpacing.zero,
            //             child: Center(
            //               child: CustomText.headline3('$remainingDays days remaining'),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
