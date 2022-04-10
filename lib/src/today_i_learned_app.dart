import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';

class TodayILearnedApp extends StatelessWidget {
  final LearningRepository learningRepository;
  final CategoryRepository categoryRepository;

  const TodayILearnedApp({
    Key? key,
    required this.learningRepository,
    required this.categoryRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoriesCubit(categoryRepository: categoryRepository)),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: learningRepository),
          RepositoryProvider.value(value: categoryRepository),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.light,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
