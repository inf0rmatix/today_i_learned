import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/learnings/blocs/blocs.dart';

class LearningsSortingSelection extends StatelessWidget {
  final LearningOrderBy value;
  final void Function(LearningOrderBy learningOrderBy) onChanged;

  const LearningsSortingSelection({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return PopupMenuButton<LearningOrderBy>(
      initialValue: value,
      onSelected: onChanged,
      color: color,
      itemBuilder: (context) => List.generate(
        LearningOrderBy.values.length,
        // ignore: prefer-extracting-callbacks
        (index) {
          final learningOrderBy = LearningOrderBy.values[index];

          return PopupMenuItem(
            value: learningOrderBy,
            child: Text(_learningOrderByLabel(learningOrderBy)),
          );
        },
      ),
      child: Material(
        elevation: AppElevation.e8,
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.S),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.M),
          child: Row(
            children: [
              const Icon(Icons.sort_rounded),
              const SizedBox(width: AppSpacing.M),
              CustomText.headline4(_learningOrderByLabel(value)),
            ],
          ),
        ),
      ),
    );
  }

  String _learningOrderByLabel(LearningOrderBy learningOrderBy) {
    var translationKey = '';

    switch (learningOrderBy) {
      case LearningOrderBy.categoryDescending:
        translationKey = LocaleKeys.learning_order_by_category_descending;
        break;
      case LearningOrderBy.categoryAscending:
        translationKey = LocaleKeys.learning_order_by_category_ascending;
        break;
      case LearningOrderBy.createdAscending:
        translationKey = LocaleKeys.learning_order_by_created_ascending;
        break;
      case LearningOrderBy.createdDescending:
        translationKey = LocaleKeys.learning_order_by_created_descending;
        break;
      case LearningOrderBy.difficultyAscending:
        translationKey = LocaleKeys.learning_order_by_difficulty_ascending;
        break;
      case LearningOrderBy.difficultyDescending:
        translationKey = LocaleKeys.learning_order_by_difficulty_descending;
        break;

      default:
        translationKey = 'ERROR';
        break;
    }

    return translationKey.translate();
  }
}
