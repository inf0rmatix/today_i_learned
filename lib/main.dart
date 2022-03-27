import 'package:flutter/material.dart';
import 'package:today_i_learned/src/mock/learnings_mock.dart';
import 'package:today_i_learned/src/pages/create_learning/create_learning_page.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository_memory.dart';
import 'package:today_i_learned/src/router/app_router.dart';
import 'package:today_i_learned/src/today_i_learned_app.dart';

void main() {
  mainInMemory();
}

Future<void> mainInMemory() async {
  AppRouter.initialize();

  var learningRepository = LearningRepositoryMemory();

  await Future.wait(LearningsMock.learnings.map((learning) => learningRepository.create(learning)));

  runApp(
    TodayILearnedApp(
      learningRepository: learningRepository,
    ),
  );
}
