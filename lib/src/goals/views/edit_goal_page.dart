import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class EditGoalPage extends StatelessWidget {
  final String? goalUid;

  const EditGoalPage({
    Key? key,
    this.goalUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditGoalCubit(
        goalUid: goalUid,
        goalRepository: context.read<GoalRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      ),
      child: _EditGoalView(),
    );
  }
}

class _EditGoalView extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();

  _EditGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a goal'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _save(context),
        child: const Icon(Icons.save_rounded),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Form(
              key: _form,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.M,
                  vertical: AppSpacing.XL,
                ),
                children: [
                  BlocSelector<EditGoalCubit, EditGoalState, String?>(
                    selector: (state) => state.goal?.uid,
                    builder: (context, uid) {
                      return CustomTextFormField(
                        key: Key('$uid-title'),
                        label: 'Title',
                        initialValue: context.read<EditGoalCubit>().state.editingGoal.title,
                        validator: RequiredValidator(errorText: 'Title is required'),
                        onChanged: (title) => context.read<EditGoalCubit>().changeTitle(title),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  BlocSelector<EditGoalCubit, EditGoalState, String?>(
                    selector: (state) => state.goal?.uid,
                    builder: (context, uid) {
                      return BlocSelector<EditGoalCubit, EditGoalState, bool>(
                        selector: (state) => state.isChangingRequirementsDisabled,
                        builder: (context, isChangingRequirementsDisabled) {
                          return CustomDateFormField(
                            key: Key('$uid-deadline'),
                            label: 'Deadline',
                            initialValue: context.read<EditGoalCubit>().state.editingGoal.deadline,
                            validator: RequiredValidator(errorText: 'Please set a deadline'),
                            onChanged: isChangingRequirementsDisabled
                                ? null
                                : (deadline) => context.read<EditGoalCubit>().changeDeadline(deadline),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  BlocSelector<EditGoalCubit, EditGoalState, String?>(
                    selector: (state) => state.goal?.uid,
                    builder: (context, uid) {
                      return CustomNumberFormField(
                        key: Key('$uid-required-learnings'),
                        label: 'Required learnings',
                        initialValue: context.read<EditGoalCubit>().state.editingGoal.requiredLearnings,
                        validator: RequiredValidator(errorText: 'Please specify an amount'),
                        onChanged: (requiredLearnings) =>
                            context.read<EditGoalCubit>().changeRequiredLearnings(requiredLearnings.toInt()),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  BlocBuilder<EditGoalCubit, EditGoalState>(
                    builder: (context, state) {
                      final isDifficultyRequirementEnabled = state.isDifficultyRequirementEnabled;
                      final isChangingRequirementsDisabled = state.isChangingRequirementsDisabled;

                      final requiredDifficulty = state.isDifficultyRequirementEnabled
                          ? state.editingGoal.requiredDifficulty
                          : state.previousRequiredDifficulty;

                      final double sliderValue =
                          requiredDifficulty != GoalModel.noDifficultyRequirementValue ? requiredDifficulty : 0;

                      return Column(
                        children: [
                          CheckboxListTile(
                            value: isDifficultyRequirementEnabled,
                            title: const Text('Set a required difficulty'),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: isChangingRequirementsDisabled
                                ? null
                                : (_) => context.read<EditGoalCubit>().toggleIsDifficultyRequirementEnabled(),
                          ),
                          CustomSlider(
                            // ignore: avoid_redundant_argument_values
                            min: AppConfig.difficultyMinimum,
                            max: AppConfig.difficultyMaximum,
                            divisions: AppConfig.difficultyDivisions,
                            value: sliderValue,
                            label: requiredDifficulty.toStringAsFixed(AppConfig.difficultyFractionDigits),
                            onChanged: (isChangingRequirementsDisabled || !isDifficultyRequirementEnabled)
                                ? null
                                : (value) => context.read<EditGoalCubit>().changeRequiredDifficulty(value),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  BlocBuilder<EditGoalCubit, EditGoalState>(
                    buildWhen: (previous, current) =>
                        previous.categories != current.categories || previous.category != current.category,
                    builder: (context, state) => CustomDropdownButtonFormField<CategoryModel>(
                      label: 'Category (optional)',
                      value: state.category,
                      items: List.generate(
                        state.categories.length,
                        // ignore: prefer-extracting-callbacks
                        (index) {
                          final category = state.categories[index];

                          return DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          );
                        },
                      ),
                      onChanged: state.isChangingRequirementsDisabled
                          ? null
                          : (category) => context.read<EditGoalCubit>().changeCategory(category),
                    ),
                  ),
                  const LabeledDivider(label: 'PREVIEW'),
                  BlocBuilder<EditGoalCubit, EditGoalState>(
                    buildWhen: (oldState, newState) =>
                        oldState.editingGoal != newState.editingGoal || oldState.category != newState.category,
                    builder: (context, state) {
                      return GoalListElement(
                        key: Key(state.editingGoal.uid),
                        goal: state.editingGoal,
                        category: state.category,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<EditGoalCubit, EditGoalState, bool>(
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

  void _save(BuildContext context) {
    final isValid = _form.currentState?.validate() ?? false;

    if (isValid) {
      FocusScope.of(context).unfocus();

      context.read<EditGoalCubit>().save();
    }
  }
}
