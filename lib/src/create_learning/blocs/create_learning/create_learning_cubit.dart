import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'create_learning_cubit.freezed.dart';
part 'create_learning_state.dart';

class CreateLearningCubit extends Cubit<CreateLearningState> {
  final LearningRepository learningRepository;
  final CategoriesCubit categoriesCubit;

  CreateLearningCubit({
    required this.learningRepository,
    required this.categoriesCubit,
  }) : super(const CreateLearningState()) {
    _initialize();
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

    newLearning = learning == null
        ? await learningRepository.create(
            LearningModel(
              uid: '',
              title: state.title,
              description: state.description,
              difficulty: state.difficulty, // TODO(1nf0rmatix): remove mock values
              category: state.category?.uid,
              created: DateTime.now(),
            ),
          )
        : await learningRepository.update(
            learning.copyWith(
              title: state.title,
              description: state.description,
              category: state.category?.uid,
              updated: DateTime.now(),
            ),
          );

    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        isLoading: false,
        learning: newLearning,
      ),
    );
  }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));

    if (categoriesCubit.state.categories.isEmpty) {
      await categoriesCubit.fetchCategories();
    }

    emit(state.copyWith(isLoading: false));
  }
}
