import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

part 'learning_details_cubit.freezed.dart';
part 'learning_details_state.dart';

class LearningDetailsCubit extends Cubit<LearningDetailsState> {
  final LearningRepository learningRepository;
  final CategoryRepository categoryRepository;

  final String learningUid;

  LearningDetailsCubit({
    required this.learningUid,
    required this.learningRepository,
    required this.categoryRepository,
  }) : super(const LearningDetailsState()) {
    _initialize();
  }

  Future _initialize() async {
    emit(state.copyWith(isLoading: true));

    final learning = await learningRepository.findOne(learningUid);

    final categoryUid = learning?.category;

    CategoryModel? category;

    if (categoryUid != null) {
      category = await categoryRepository.findOne(categoryUid);
    }

    emit(
      state.copyWith(
        isLoading: false,
        learning: learning,
        category: category,
      ),
    );
  }
}
