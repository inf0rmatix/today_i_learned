import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/mock/categories_mock.dart';
import 'package:today_i_learned/src/mock/learnings_mock.dart';
import 'package:today_i_learned/src/today_i_learned_app.dart';

void main() {
  mainInMemory();
}

Future<void> mainInMemory() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppRouter.initialize();

  var learningRepository = LearningRepositoryMemory();
  var categoryRepository = CategoryRepositoryMemory();

  await LearningsMock.createAll(learningRepository);
  await CategoriesMock.createAll(categoryRepository);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/translations/',
      fallbackLocale: const Locale('en'),
      child: TodayILearnedApp(
        learningRepository: learningRepository,
      ),
    ),
  );
}
