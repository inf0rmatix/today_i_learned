import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

part 'category_details_cubit.freezed.dart';
part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  final CategoryRepository categoryRepository;
  final LearningRepository learningRepository;

  CategoryDetailsCubit({
    required String categoryUid,
    required this.categoryRepository,
    required this.learningRepository,
  }) : super(CategoryDetailsState(categoryUid: categoryUid)) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));

    final category = await categoryRepository.findOne(state.categoryUid);

    // TODO(inf0rmatix): actually query for category
    final learnings = await learningRepository.findAll();

    emit(
      state.copyWith(
        category: category,
        learnings: learnings.where((element) => element.category == state.categoryUid).toList(),
        isLoading: false,
      ),
    );
  }
}
