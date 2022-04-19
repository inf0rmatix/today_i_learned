// ignore_for_file: no-magic-number

import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/goals/goals.dart';

// ignore: avoid_classes_with_only_static_members
class GoalsMock {
  static Future createAll(GoalRepository goalRepository) async {
    await goalRepository.create(
      GoalModel(
        uid: '',
        title: 'Learn five things',
        created: DateTime.now().subtract(const Duration(days: 14)),
        deadline: DateTime.now().add(const Duration(days: 5)),
        completed: DateTime.now(),
        learnings: 5,
        requiredLearnings: 5,
        isAchieved: true,
      ),
    );

    await goalRepository.create(
      GoalModel(
        uid: '',
        title: 'Learn ten things',
        created: DateTime.now().subtract(const Duration(days: 4)),
        deadline: DateTime.now().add(const Duration(days: 30)),
        learnings: 9,
        requiredLearnings: 10,
      ),
    );

    await goalRepository.create(
      GoalModel(
        uid: '',
        title: 'Learn something difficult',
        created: DateTime.now().subtract(const Duration(days: 1)),
        deadline: DateTime.now().add(const Duration(days: 45)),
        requiredLearnings: 1,
        requiredDifficulty: AppConfig.difficultyMaximum,
      ),
    );

    await goalRepository.create(
      GoalModel(
        uid: '',
        title: 'Learn 4 medium difficult things',
        created: DateTime.now().subtract(const Duration(days: 15)),
        deadline: DateTime.now().add(const Duration(days: 30)),
        learnings: 1,
        requiredLearnings: 4,
        requiredDifficulty: AppConfig.difficultyMaximum / 2,
      ),
    );
  }
}
