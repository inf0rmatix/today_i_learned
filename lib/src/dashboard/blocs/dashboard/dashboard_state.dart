// ignore_for_file: no-magic-number

part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default([]) List<LearningModel> learnings,
    @Default([]) List<LearningModel> mostRecentLearnings,
    @Default(false) bool isLoading,
    @Default(0) int learningsPastSevenDays,
    @Default(0) int learningsPastMonth,
  }) = _DashboardState;
}
