part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryModel> categories,
  }) = _CategoriesState;
}
