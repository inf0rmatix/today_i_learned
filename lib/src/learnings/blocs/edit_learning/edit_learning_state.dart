part of 'edit_learning_cubit.dart';

@freezed
class EditLearningState with _$EditLearningState {
  const factory EditLearningState({
    // TODO(inf0rmatx): use the model for learning
    @Default('') String title,
    @Default('') String description,
    // ignore: no-magic-number
    @Default(0) double difficulty,
    CategoryModel? category,
    @Default(false) bool isLoading,
    LearningModel? learning,
  }) = _EditLearningState;
}
