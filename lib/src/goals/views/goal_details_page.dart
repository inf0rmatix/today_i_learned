import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class GoalDetailsPage extends StatelessWidget {
  final String goalUid;

  const GoalDetailsPage({
    Key? key,
    required this.goalUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalDetailsCubit(
        goalUid: goalUid,
        goalRepository: context.read<GoalRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      ),
      child: const _GoalDetailsPageView(),
    );
  }
}

class _GoalDetailsPageView extends StatelessWidget {
  const _GoalDetailsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<GoalDetailsCubit, GoalDetailsState, String>(
          selector: (state) => state.goal?.title ?? 'Loading...',
          builder: (context, title) {
            return Text(title);
          },
        ),
      ),
      floatingActionButton: BlocSelector<GoalDetailsCubit, GoalDetailsState, String?>(
        selector: (state) => state.goal?.uid,
        builder: (context, goalUid) {
          return FloatingActionButton(
            onPressed: goalUid == null ? null : () => context.goNamed(AppRoutes.editGoal, params: {'goalUid': goalUid}),
            child: const Icon(Icons.edit_rounded),
          );
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<GoalDetailsCubit, GoalDetailsState>(
            // buildWhen:(oldState, newState) => oldState.goal != newState.goal || oldState.ca
            builder: (context, state) {
              final goal = state.goal;

              return goal == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GoalListElement(
                      goal: goal,
                      category: state.category,
                    );
            },
          ),
        ],
      ),
    );
  }
}
