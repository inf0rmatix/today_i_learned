part of 'edit_goal_cubit.dart';

@freezed
class EditGoalState with _$EditGoalState {
  const factory EditGoalState({
    required GoalModel editingGoal,
    GoalModel? goal,
    CategoryModel? category,
    @Default([]) List<CategoryModel> categories,
    @Default(false) bool isChangingRequirementsDisabled,
    @Default(false) bool isDifficultyRequirementEnabled,
    @Default(GoalModel.noDifficultyRequirementValue) double previousRequiredDifficulty,
    @Default(false) bool isLoading,
  }) = _EditGoalState;
}
