import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'create_learning_cubit.freezed.dart';
part 'create_learning_state.dart';

class CreateLearningCubit extends Cubit<CreateLearningState> {
  LearningRepository learningRepository;

  CreateLearningCubit({
    required this.learningRepository,
  }) : super(const CreateLearningState());

  void changeTitle(String value) {
    emit(state.copyWith(title: value));
  }

  void changeDescription(String description) {
    emit(state.copyWith(description: description));
  }

  Future<void> save() async {
    if (state.title.isEmpty || state.description.isEmpty) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    var learning = state.learning;

    LearningModel newLearning;

    newLearning = learning == null
        ? await learningRepository.create(
            LearningModel(
              uid: '',
              title: state.title,
              description: state.description,
              difficulty: 'super hard', // TODO(1nf0rmatix): remove mock values
              category: 'flutter',
              created: DateTime.now(),
            ),
          )
        : await learningRepository.update(
            learning.copyWith(
              title: state.title,
              description: state.description,
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

  void changeDifficulty(String difficulty) {
    emit(state.copyWith(difficulty: difficulty));
  }

  void changeCategory(String category) {
    emit(state.copyWith(category: category));
  }
}
