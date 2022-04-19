import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';

part 'edit_category_cubit.freezed.dart';
part 'edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  final CategoryRepository categoryRepository;

  EditCategoryCubit({
    required this.categoryRepository,
  }) : super(const EditCategoryState());

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true));

    final category = state.category;

    CategoryModel newCategory;

    if (category == null) {
      newCategory = await categoryRepository.create(
        CategoryModel(
          uid: '',
          name: state.name,
        ),
      );
    } else {
      newCategory = category.copyWith(name: state.name);

      newCategory = newCategory == category ? newCategory : await categoryRepository.update(newCategory);
    }

    emit(
      state.copyWith(
        isLoading: false,
        category: newCategory,
      ),
    );
  }
}
