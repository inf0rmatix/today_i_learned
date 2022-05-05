import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/goals/models/models.dart';

class GoalListElement extends StatelessWidget {
  final GoalModel goal;
  final Function(GoalModel goal)? onTap;

  const GoalListElement({
    Key? key,
    required this.goal,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final learningProgress = goal.requiredLearnings > 0 ? goal.learnings / goal.requiredLearnings : 0.0;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!(goal),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.M),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  goal.isAchieved ? Icons.emoji_events_rounded : Icons.sports_score_rounded,
                  size: AppIconSize.L,
                ),
                title: CustomText.headline1(goal.title),
              ),
              if (goal.isAchieved && goal.completed != null)
                ListTile(
                  leading: const Icon(Icons.event_available_rounded),
                  title: Text(goal.completed!.formatFullDate(context.locale)),
                ),
              if (!goal.isAchieved)
                ListTile(
                  leading: const Icon(Icons.event_rounded),
                  title: Text(goal.deadline.formatWeekdayDate(context.locale)),
                ),
              ListTile(
                leading: const Icon(Icons.tag_rounded),
                title: Text('${goal.requiredLearnings} Learnings'),
              ),
              if (goal.requiredDifficulty != GoalModel.noDifficultyRequirementValue)
                ListTile(
                  leading: const Icon(Icons.construction_rounded),
                  title: Text('${goal.requiredDifficulty} minimum difficulty'),
                ),
              if (!goal.isAchieved)
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
            ],
          ),
        ),
      ),
    );
  }
}
