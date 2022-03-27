import 'package:flutter/material.dart';
import 'package:today_i_learned/src/pages/create_learning_page.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository_memory.dart';
import 'package:today_i_learned/src/today_i_learned_app.dart';

void main() {
  mainInMemory();
}

void mainInMemory() {
  runApp(
    TodayILearnedApp(
      learningRepository: LearningRepositoryMemory(),
    ),
  );
}
