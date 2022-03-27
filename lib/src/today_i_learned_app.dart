import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/pages/create_learning/create_learning_page.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository.dart';
import 'package:today_i_learned/src/router/app_router.dart';

class TodayILearnedApp extends StatelessWidget {
  final LearningRepository learningRepository;

  const TodayILearnedApp({
    Key? key,
    required this.learningRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: learningRepository),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
      ),
    );
  }
}
