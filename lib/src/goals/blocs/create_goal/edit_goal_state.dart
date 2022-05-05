part of 'edit_goal_cubit.dart';

@freezed
class EditGoalState with _$EditGoalState {
  const factory EditGoalState({
    required GoalModel editingGoal,
    GoalModel? goal,
    @Default(false) bool isChangingRequirementsDisabled,
    @Default(false) bool isDifficultyRequirementEnabled,
    @Default(GoalModel.noDifficultyRequirementValue) double previousRequiredDifficulty,
    @Default(false) bool isLoading,
  }) = _EditGoalState;
}
