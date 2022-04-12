part of 'goals_cubit.dart';

@freezed
class GoalsState with _$GoalsState {
  const factory GoalsState({
    @Default([]) List<GoalModel> goals,
    @Default(false) bool isLoading,
  }) = _GoalsState;
}
