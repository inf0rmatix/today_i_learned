import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/dashboard/blocs/blocs.dart';
import 'package:today_i_learned/src/dashboard/widgets/widgets.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create_rounded),
        onPressed: () => context.goNamed(AppRoutes.createLearning),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.L),
        child: ListView(
          children: [
            Wrap(
              spacing: AppSpacing.L,
              runSpacing: AppSpacing.L,
              children: [
                BlocSelector<DashboardCubit, DashboardState, int>(
                  selector: (state) => state.learningsPastSevenDays,
                  builder: (context, learningsPastSevenDays) {
                    return ScoreCard(
                      title: LocaleKeys.dashboard_score_seven_days_title
                          .translate(),
                      subtitle:
                          LocaleKeys.dashboard_score_seven_days_text.translate(
                        arguments: [learningsPastSevenDays.toString()],
                      ),
                    );
                  },
                ),
                BlocSelector<DashboardCubit, DashboardState, int>(
                  selector: (state) => state.learningsPastMonth,
                  builder: (context, learningsPastMonth) {
                    return ScoreCard(
                      title: LocaleKeys.dashboard_score_past_month_title
                          .translate(),
                      subtitle:
                          LocaleKeys.dashboard_score_past_month_text.translate(
                        arguments: [learningsPastMonth.toString()],
                      ),
                    );
                  },
                ),
                BlocSelector<DashboardCubit, DashboardState,
                    List<LearningModel>>(
                  selector: (state) => state.mostRecentLearnings,
                  builder: (context, mostRecentLearnings) {
                    return LastLearned(learnings: mostRecentLearnings);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
