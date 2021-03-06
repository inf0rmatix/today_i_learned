import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/goals/models/models.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';
import 'package:today_i_learned/src/learnings/models/learning/learning_model.dart';

part 'goals_cubit.freezed.dart';
part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GoalRepository goalRepository;
  final CategoryRepository categoryRepository;

  late StreamSubscription _streamSubscription;

  GoalsCubit({
    required this.goalRepository,
    required this.categoryRepository,
  }) : super(const GoalsState()) {
    _initializeListeningForChanges();

    fetchGoals();
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();

    return super.close();
  }

  void _initializeListeningForChanges() {
    // TODO(informatix): listen for category changes too

    _streamSubscription = goalRepository.changes.listen(_onGoalChanged);
  }

  Future<void> fetchGoals() async {
    emit(state.copyWith(isLoading: true));

    final goals = await goalRepository.findAll();
    final categories = await categoryRepository.findAll();

    emit(
      state.copyWith(
        isLoading: false,
        goals: goals,
        categories: categories,
      ),
    );
  }

  Future<GoalModel> increaseGoalLearnings(GoalModel goal) {
    final learnings = goal.learnings + 1;
    final isAchieved = learnings >= goal.requiredLearnings;

    final updatedGoal = goal.copyWith(
      learnings: learnings,
      isAchieved: isAchieved,
      completed: isAchieved ? DateTime.now() : null,
    );

    return goalRepository.update(updatedGoal);
  }

  void _onGoalChanged(EntityChangedEvent<GoalModel> event) {
    switch (event.type) {
      case EntityChangedEventType.created:
        emit(state.copyWith(goals: state.goals.toList()..add(event.object)));
        break;

      case EntityChangedEventType.updated:
        emit(
          state.copyWith(
            goals: state.goals.toList()
              ..removeWhere((element) => element.uid == event.object.uid)
              ..add(event.object),
          ),
        );
        break;

      case EntityChangedEventType.deleted:
        emit(state.copyWith(goals: state.goals.toList()..removeWhere((element) => element.uid == event.object.uid)));
        break;
    }
  }

  Future<void> onLearningCreated(LearningModel learning) async {
    // TODO(inf0rmatix): implement query to reduce unnecessary reads
    final goals = await goalRepository.findAll();

    final contributedGoals = goals.where(
      (goal) {
        final isNotComplete = !goal.isAchieved;
        final isWithinDeadline = goal.deadline.isAfter(learning.created);
        final isRequiredDifficultyMet = goal.requiredDifficulty == GoalModel.noDifficultyRequirementValue ||
            learning.difficulty >= goal.requiredDifficulty;

        final hasCategoryRequirement = goal.category != null;
        final isCategoryRequirementMet = (hasCategoryRequirement && goal.category == learning.category) || true;

        return isNotComplete && isWithinDeadline && isRequiredDifficultyMet && isCategoryRequirementMet;
      },
    );

    for (final goal in contributedGoals) {
      increaseGoalLearnings(goal);
    }
  }
}
