import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/models/learning_model.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository.dart';

part 'create_learning_state.dart';
part 'create_learning_cubit.freezed.dart';

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

    if (learning == null) {
      newLearning = await learningRepository.create(
        LearningModel(
          uid: '',
          title: state.title,
          description: state.description,
        ),
      );
    } else {
      newLearning = await learningRepository.update(
        learning.copyWith(
          title: state.title,
          description: state.description,
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        isLoading: false,
        learning: newLearning,
      ),
    );
  }
}
