import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/goals/goals.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';
import 'package:today_i_learned/src/today_i_learned_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await bootstrapHive();

  AppRouter.initialize();

  final learningRepository = LearningRepositoryHive();
  final categoryRepository = CategoryRepositoryHive();
  final goalRepository = GoalRepositoryHive();

  await Future.wait([
    learningRepository.initialize(),
    categoryRepository.initialize(),
    goalRepository.initialize(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: TodayILearnedApp(
        learningRepository: learningRepository,
        categoryRepository: categoryRepository,
        goalRepository: goalRepository,
      ),
    ),
  );
}

Future<void> bootstrapHive() async {
  final appDirectory = await getApplicationDocumentsDirectory();
  const hiveDirectory = 'hive';

  Hive.init(join(appDirectory.path, hiveDirectory));
}
