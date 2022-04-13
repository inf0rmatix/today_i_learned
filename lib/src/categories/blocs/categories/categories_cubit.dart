import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/models/models.dart';
import 'package:today_i_learned/src/categories/repositories/repositories.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;

  CategoriesCubit({
    required this.categoryRepository,
  }) : super(const CategoriesState()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));

    final categories = await categoryRepository.findAll();

    emit(state.copyWith(isLoading: false, categories: categories));
  }

  CategoryModel? findByUid(String? category) {
    return state.categories.firstWhereOrNull((element) => element.uid == category);
  }
}
