part of 'learnings_cubit.dart';

@freezed
class LearningsState with _$LearningsState {
  const factory LearningsState({
    @Default(false) bool isLoading,
    @Default([]) List<LearningModel> learnings,
    @Default([]) List<LearningWithCategory> sortedLearnings,
    @Default(LearningOrderBy.createdDescending) LearningOrderBy learningOrderBy,
  }) = _LearningsState;
}
