import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;

  CategoriesCubit({
    required this.categoryRepository,
  }) : super(const CategoriesState());

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));

    final categories = await categoryRepository.findAll();

    emit(state.copyWith(isLoading: false, categories: categories));
  }
}
