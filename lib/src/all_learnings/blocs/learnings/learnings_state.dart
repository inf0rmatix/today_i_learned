part of 'learnings_cubit.dart';

@freezed
class LearningsState with _$LearningsState {
  const factory LearningsState({
    @Default(false) bool isLoading,
    @Default([]) List<LearningModel> learnings,
  }) = _LearningsState;
}
