import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(AppRoutes.createGoal),
        child: const Icon(Icons.add_rounded),
      ),
      body: BlocBuilder<GoalsCubit, GoalsState>(
        // selector: (state) => state.goals.toList(),
        builder: (context, state) {
          final goals = state.goals.toList();
          final categories = state.categories.toList();

          goals.sort((a, b) => a.deadline.compareTo(b.deadline));
          // ignore: no-magic-number
          goals.sort((a, b) => a.isAchieved && !b.isAchieved ? 1 : -1);

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.M),
            itemCount: goals.length,
            itemBuilder: (context, index) {
              final goal = goals[index];
              final category = goal.category == null
                  ? null
                  : categories.firstWhereOrNull((category) => category.uid == goal.category);

              return GoalListElement(
                goal: goals[index],
                category: category,
                onTap: (goal) => context.goNamed(AppRoutes.goalDetails, params: {'goalUid': goal.uid}),
              );
            },
            separatorBuilder: (_, index) {
              final goal = goals[index];
              final nextIndex = index + 1;
              final nextGoal = nextIndex < goals.length ? goals[nextIndex] : null;

              final isBetweenCompleteAndOnGoing = !goal.isAchieved && nextGoal != null && nextGoal.isAchieved;

              if (isBetweenCompleteAndOnGoing) {
                return const LabeledDivider(label: '🎉 COMPLETED GOALS 🎊');
              }

              return const SizedBox(height: AppSpacing.M);
            },
          );
        },
      ),
    );
  }
}
