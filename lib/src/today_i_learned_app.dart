import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';

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
        theme: AppTheme.light,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
