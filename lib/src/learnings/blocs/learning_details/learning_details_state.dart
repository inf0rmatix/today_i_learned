part of 'learning_details_cubit.dart';

@freezed
class LearningDetailsState with _$LearningDetailsState {
  const factory LearningDetailsState({
    LearningModel? learning,
    CategoryModel? category,
    @Default(false) bool isLoading,
  }) = _LearningDetailsState;
}
