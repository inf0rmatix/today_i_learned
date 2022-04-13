import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/learnings/models/models.dart';
import 'package:today_i_learned/src/learnings/repositories/repositories.dart';

part 'edit_learning_cubit.freezed.dart';
part 'edit_learning_state.dart';

// TODO(1nf0rmatix): implement auto-saving
class EditLearningCubit extends Cubit<EditLearningState> {
  final LearningRepository learningRepository;
  final CategoriesCubit categoriesCubit;

  EditLearningCubit({
    String? learningUid,
    required this.learningRepository,
    required this.categoriesCubit,
  }) : super(const EditLearningState()) {
    _initialize(learningUid);
  }

  void changeTitle(String value) {
    emit(state.copyWith(title: value));
  }

  void changeDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void changeDifficulty(double difficulty) {
    emit(state.copyWith(difficulty: difficulty));
  }

  void changeCategory(CategoryModel? category) {
    emit(state.copyWith(category: category));
  }

  Future<void> save() async {
    if (state.title.isEmpty || state.description.isEmpty) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final learning = state.learning;

    LearningModel newLearning;

    if (learning == null) {
      newLearning = await learningRepository.create(
        LearningModel(
          uid: '',
          title: state.title,
          description: state.description,
          difficulty: state.difficulty,
          category: state.category?.uid,
          created: DateTime.now(),
        ),
      );
    } else {
      newLearning = learning.copyWith(
        title: state.title,
        description: state.description,
        category: state.category?.uid,
      );

      newLearning = newLearning == state.learning
          ? newLearning
          : await learningRepository.update(
              newLearning.copyWith(
                updated: DateTime.now(),
              ),
            );
    }

    emit(
      state.copyWith(
        isLoading: false,
        learning: newLearning,
      ),
    );
  }

  Future<void> _initialize(String? learningUid) async {
    emit(state.copyWith(isLoading: true));

    if (categoriesCubit.state.categories.isEmpty) {
      await categoriesCubit.fetchCategories();
    }

    LearningModel? learning;

    if (learningUid != null) {
      learning = await learningRepository.findOne(learningUid);
    }

    final CategoryModel? category = learning != null && learning.category != null
        ? categoriesCubit.state.categories.firstWhereOrNull((element) => element.uid == learning!.category)
        : null;

    emit(
      state.copyWith(
        isLoading: false,
        learning: learning,
        title: learning?.title ?? state.title,
        description: learning?.description ?? state.description,
        difficulty: learning?.difficulty ?? state.difficulty,
        category: category,
      ),
    );
  }
}
