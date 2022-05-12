part of 'goal_details_cubit.dart';

@freezed
class GoalDetailsState with _$GoalDetailsState {
  const factory GoalDetailsState({
    required String goalUid,
    GoalModel? goal,
    CategoryModel? category,
    @Default(false) bool isLoading,
  }) = _GoalDetailsState;
}
