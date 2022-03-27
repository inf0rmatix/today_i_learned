part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<LearningModel> learnings,
    @Default(false) bool isLoading,
  }) = _DashboardState;
}
