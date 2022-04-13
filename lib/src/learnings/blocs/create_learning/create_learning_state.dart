part of 'create_learning_cubit.dart';

@freezed
class CreateLearningState with _$CreateLearningState {
  const factory CreateLearningState({
    // TODO(1nf0rmatx): use the model for learning
    @Default('') String title,
    @Default('') String description,
    // ignore: no-magic-number
    @Default(0) double difficulty,
    CategoryModel? category,
    @Default(false) bool isLoading,
    LearningModel? learning,
  }) = _CreateLearningState;
}
