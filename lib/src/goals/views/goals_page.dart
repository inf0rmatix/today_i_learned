import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => null,
    //   child: _GoalsView(),
    // );

    return const _GoalsView();
  }
}

// ignore: prefer-single-widget-per-file
class _GoalsView extends StatelessWidget {
  const _GoalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals'),
      ),
      body: BlocSelector<GoalsCubit, GoalsState, List<GoalModel>>(
        selector: (state) => state.goals,
        builder: (context, goals) {
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.M),
            itemCount: goals.length,
            itemBuilder: (context, index) => GoalListElement(goal: goals[index]),
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.M),
          );
        },
      ),
    );
  }
}
