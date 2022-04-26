part of 'category_details_cubit.dart';

@freezed
class CategoryDetailsState with _$CategoryDetailsState {
  const factory CategoryDetailsState({
    required String categoryUid,
    CategoryModel? category,
    @Default([]) List<LearningModel> learnings,
    @Default(false) bool isLoading,
  }) = _CategoryDetailsState;
}
