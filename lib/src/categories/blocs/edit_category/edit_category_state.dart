part of 'edit_category_cubit.dart';

@freezed
class EditCategoryState with _$EditCategoryState {
  const factory EditCategoryState({
    @Default(false) bool isLoading,
    @Default('') String name,
    CategoryModel? category,
  }) = _EditCategoryState;
}
