import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/dashboard/dashboard.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
        learningRepository: context.read<LearningRepository>(),
      ),
      child: const _DashboardPageView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _DashboardPageView extends StatelessWidget {
  const _DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.dashboard_title.translate()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.M),
        children: const [
          LearningsLatestScores(),
          MostDifficultLearning(),
          LastLearned(),
        ],
      ),
    );
  }
}
