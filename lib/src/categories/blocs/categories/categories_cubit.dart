import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/app/repositories/crud_repository.dart';
import 'package:today_i_learned/src/categories/models/models.dart';
import 'package:today_i_learned/src/categories/repositories/repositories.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;

  late StreamSubscription _onChangesSubscription;

  CategoriesCubit({
    required this.categoryRepository,
  }) : super(const CategoriesState()) {
    _initialize();
  }

  @override
  Future<void> close() async {
    await _onChangesSubscription.cancel();

    return super.close();
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(isLoading: true));

    final categories = await categoryRepository.findAll();

    emit(state.copyWith(isLoading: false, categories: categories));
  }

  CategoryModel? findByUid(String? category) {
    return state.categories.firstWhereOrNull((element) => element.uid == category);
  }

  void _initialize() {
    fetchCategories();

    _onChangesSubscription = categoryRepository.changes.listen(_onCategoryChangeEvent);
  }

  void _onCategoryChangeEvent(EntityChangedEvent<CategoryModel> event) {
    switch (event.type) {
      case EntityChangedEventType.created:
        emit(
          state.copyWith(
            categories: state.categories.toList()..add(event.object),
          ),
        );

        break;
      case EntityChangedEventType.updated:
        final category = event.object;

        emit(
          state.copyWith(
            categories: state.categories.toList()
              ..removeWhere((element) => element.uid == category.uid)
              ..add(category),
          ),
        );

        break;

      case EntityChangedEventType.deleted:
        emit(
          state.copyWith(
            categories: state.categories.toList()..removeWhere((category) => category.uid == event.object.uid),
          ),
        );

        break;
    }
  }
}
