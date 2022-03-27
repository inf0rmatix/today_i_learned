import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/mock/learnings_mock.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository_memory.dart';
import 'package:today_i_learned/src/router/app_router.dart';
import 'package:today_i_learned/src/today_i_learned_app.dart';

void main() {
  mainInMemory();
}

Future<void> mainInMemory() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  AppRouter.initialize();

  var learningRepository = LearningRepositoryMemory();

  await Future.wait(LearningsMock.learnings.map((learning) => learningRepository.create(learning)));

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
