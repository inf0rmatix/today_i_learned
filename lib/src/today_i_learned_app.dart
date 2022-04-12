import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';

class TodayILearnedApp extends StatelessWidget {
  final LearningRepository learningRepository;
  final CategoryRepository categoryRepository;
  final GoalRepository goalRepository;

  const TodayILearnedApp({
    Key? key,
    required this.learningRepository,
    required this.categoryRepository,
    required this.goalRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoriesCubit(categoryRepository: categoryRepository)),
        BlocProvider(create: (_) => GoalsCubit(goalRepository: goalRepository)),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: learningRepository),
          RepositoryProvider.value(value: categoryRepository),
          RepositoryProvider.value(value: goalRepository),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Today I Learned',
          theme: theme,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (_, child) => CustomBottomNavigationBar(
            theme: theme,
            child: child,
          ),
        ),
      ),
    );
  }
}
