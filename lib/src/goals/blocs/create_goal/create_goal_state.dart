part of 'create_goal_cubit.dart';

@freezed
class CreateGoalState with _$CreateGoalState {
  const factory CreateGoalState({
    @Default('') String title,
    DateTime? deadline,
    int? requiredLearnings,
    @Default(false) bool isDifficultyRequirementEnabled,
    double? requiredDifficulty,
    double? previousRequiredDifficulty,
    @Default(false) bool isLoading,
    GoalModel? goal,
  }) = _CreateGoalState;
}
