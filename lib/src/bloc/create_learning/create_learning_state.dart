part of 'create_learning_cubit.dart';

@freezed
class CreateLearningState with _$CreateLearningState {
  const factory CreateLearningState({
    @Default('') String title,
    @Default('') String description,
    @Default(false) bool isLoading,
    LearningModel? learning,
  }) = _CreateLearningState;
}
