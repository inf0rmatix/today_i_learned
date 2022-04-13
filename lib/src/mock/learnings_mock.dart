import 'dart:math';

import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

// ignore: avoid_classes_with_only_static_members
class LearningsMock {
  static final learnings = <LearningModel>[
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: '''
Molestias expedita nam dolores est consequatur aut deleniti aut. Repellendus ipsam molestiae odit exercitationem possimus incidunt sint. Voluptas omnis in laboriosam vitae. Adipisci eum laboriosam qui error dolore quam. Enim aut amet.
 
Reiciendis accusantium deserunt minima itaque eos. Suscipit eum eius praesentium odio aliquid facere dolores et. Minus rem vel nobis aliquam.
 
Aut nihil accusamus deleniti corrupti quae harum quis quaerat. Quidem est incidunt cumque iste quod et non quisquam. Maiores veritatis quia est aut est repellendus officia dignissimos libero. Nam est atque et. Rerum deleniti labore totam illum autem quis explicabo. Praesentium accusantium dolorem libero sint eum debitis ducimus recusandae.''',
      difficulty: randomDifficulty(),
      category: '3',
      created: DateTime.now().subtract(const Duration(days: 4)),
      updated: DateTime.now().subtract(const Duration(days: 3)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '2',
      created: DateTime.now().subtract(const Duration(days: 5)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '1',
      created: DateTime.now().subtract(const Duration(days: 7)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '2',
      created: DateTime.now().subtract(const Duration(days: 9)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '3',
      created: DateTime.now().subtract(const Duration(days: 12)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '4',
      created: DateTime.now().subtract(const Duration(days: 15)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '4',
      created: DateTime.now().subtract(const Duration(days: 16)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '4',
      created: DateTime.now().subtract(const Duration(days: 20)),
    ),
    LearningModel(
      uid: '',
      title: 'Something nice',
      description: 'I quite appreciate that',
      difficulty: randomDifficulty(),
      category: '4',
      created: DateTime.now().subtract(const Duration(days: 21)),
    ),
    LearningModel(
      uid: '',
      title: 'Super difficult things',
      description: "I want to challenge myself and learn all pokemon by heart. Gotta catch 'em all!",
      difficulty: AppConfig.difficultyMaximum,
      category: '4',
      created: DateTime.now().subtract(const Duration(days: 24)),
    ),
  ];

  static Future createAll(LearningRepository learningRepository) async {
    for (final learning in learnings) {
      await learningRepository.create(learning);
    }
  }

  static double randomDifficulty() {
    const stepSize = AppConfig.difficultyMaximum / AppConfig.difficultyDivisions;

    final steps = (Random().nextDouble() * AppConfig.difficultyDivisions).round();

    return steps * stepSize;
  }
}
