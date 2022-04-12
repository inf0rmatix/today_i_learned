import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class CreateGoalPage extends StatelessWidget {
  const CreateGoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGoalCubit(
        goalRepository: context.read<GoalRepository>(),
      ),
      child: const _CreateGoalView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _CreateGoalView extends StatelessWidget {
  const _CreateGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a goal'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CreateGoalCubit>().save(),
        child: const Icon(Icons.save_rounded),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.M,
                vertical: AppSpacing.XL,
              ),
              children: [
                BlocSelector<CreateGoalCubit, CreateGoalState, String>(
                  selector: (state) => state.title,
                  builder: (context, title) {
                    return CustomTextFormField(
                      label: 'Title',
                      initialValue: title,
                      onChanged: (title) => context.read<CreateGoalCubit>().changeTitle(title),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                BlocSelector<CreateGoalCubit, CreateGoalState, DateTime?>(
                  selector: (state) => state.deadline,
                  builder: (context, deadline) {
                    return CustomDateFormField(
                      label: 'Deadline',
                      initialValue: deadline,
                      onChanged: (deadline) => context.read<CreateGoalCubit>().changeDeadline(deadline),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                BlocSelector<CreateGoalCubit, CreateGoalState, int?>(
                  selector: (state) => state.requiredLearnings,
                  builder: (context, requiredLearnings) {
                    return CustomNumberFormField(
                      label: 'Required learnings',
                      initialValue: requiredLearnings,
                      onChanged: (requiredLearnings) =>
                          context.read<CreateGoalCubit>().changeRequiredLearnings(requiredLearnings.toInt()),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                BlocSelector<CreateGoalCubit, CreateGoalState, bool>(
                  selector: (state) => state.isDifficultyRequirementEnabled,
                  builder: (context, isDifficultyRequirementEnabled) {
                    return Column(
                      children: [
                        CheckboxListTile(
                          value: isDifficultyRequirementEnabled,
                          title: const Text('Set a required difficulty'),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) => context.read<CreateGoalCubit>().toggleIsDifficultyRequirementEnabled(),
                        ),
                        // CustomText.headline3('Required difficulty'),
                        BlocSelector<CreateGoalCubit, CreateGoalState, double?>(
                          selector: (state) => state.isDifficultyRequirementEnabled
                              ? state.requiredDifficulty
                              : state.previousRequiredDifficulty,
                          builder: (context, requiredDifficulty) {
                            return CustomSlider(
                              // ignore: avoid_redundant_argument_values
                              min: AppConfig.difficultyMinimum,
                              max: AppConfig.difficultyMaximum,
                              divisions: AppConfig.difficultyDivisions,
                              // ignore: no-magic-number
                              value: requiredDifficulty ?? 0,
                              label: requiredDifficulty?.toStringAsFixed(AppConfig.difficultyFractionDigits),
                              onChanged: isDifficultyRequirementEnabled
                                  ? (value) => context.read<CreateGoalCubit>().changeRequiredDifficulty(value)
                                  : null,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                BlocBuilder<CreateGoalCubit, CreateGoalState>(
                  builder: (context, state) {
                    final now = DateTime.now();

                    final temporaryGoal = GoalModel(
                      uid: '',
                      title: state.title.isEmpty ? 'Your fancy title' : state.title,
                      created: now,
                      deadline: state.deadline ?? now,
                      learnings: 0,
                      requiredLearnings: state.requiredLearnings ?? 0,
                      requiredDifficulty: state.isDifficultyRequirementEnabled
                          ? state.requiredDifficulty ?? GoalModel.noDifficultyRequirementValue
                          : GoalModel.noDifficultyRequirementValue,
                    );

                    return GoalListElement(goal: temporaryGoal);
                  },
                ),
              ],
            ),
          ),
          BlocSelector<CreateGoalCubit, CreateGoalState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, isLoading) => isLoading
                ? Positioned.fill(
                    child: Container(
                      color: Colors.black26,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
