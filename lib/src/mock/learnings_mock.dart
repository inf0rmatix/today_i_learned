import 'dart:math';

import 'package:today_i_learned/src/core/core.dart';

class LearningsMock {
  static final learnings = <LearningModel>[
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 2),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 4),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 5),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 5),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 7),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: 'flutter',
      created: DateTime(2022, 3, 8),
    ),
  ];

  static Future createAll(LearningRepository learningRepository) async {
    for (var learning in learnings) {
      await learningRepository.create(learning);
    }
  }

  static double randomDifficulty() {
    return (Random().nextDouble() * AppConfig.difficultyMaximum)
        .clamp(AppConfig.difficultyMinimum, AppConfig.difficultyMaximum)
        .toDouble();
  }
}
