import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/goals/models/models.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';

part 'create_goal_cubit.freezed.dart';
part 'create_goal_state.dart';

class CreateGoalCubit extends Cubit<CreateGoalState> {
  final GoalRepository goalRepository;

  // TODO(1nf0rmatix): add autosave for valid states. DEFINITELY :) Streamchat approved
  CreateGoalCubit({
    required this.goalRepository,
  }) : super(const CreateGoalState());

  void changeTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void changeDeadline(DateTime deadline) {
    emit(state.copyWith(deadline: deadline));
  }

  void changeRequiredLearnings(int requiredLearnings) {
    emit(state.copyWith(requiredLearnings: requiredLearnings));
  }

  void changeRequiredDifficulty(double requiredDifficulty) {
    emit(
      state.copyWith(
        requiredDifficulty: requiredDifficulty,
        previousRequiredDifficulty: requiredDifficulty,
      ),
    );
  }

  void toggleIsDifficultyRequirementEnabled() {
    final isDifficultyRequirementEnabled = !state.isDifficultyRequirementEnabled;

    emit(
      state.copyWith(
        isDifficultyRequirementEnabled: isDifficultyRequirementEnabled,
        requiredDifficulty:
            isDifficultyRequirementEnabled ? state.previousRequiredDifficulty : GoalModel.noDifficultyRequirementValue,
      ),
    );
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true));

    GoalModel? goal = state.goal;

    if (goal == null) {
      goal = GoalModel(
        uid: '',
        title: state.title,
        created: DateTime.now(),
        deadline: state.deadline!,
        requiredLearnings: state.requiredLearnings!,
        requiredDifficulty: state.requiredDifficulty ?? GoalModel.noDifficultyRequirementValue,
      );

      goal = await goalRepository.create(goal);
    } else {
      goal = goal.copyWith(
        title: state.title,
        deadline: state.deadline ?? goal.deadline,
        requiredLearnings: state.requiredLearnings ?? goal.requiredLearnings,
        requiredDifficulty: state.requiredDifficulty ?? goal.requiredDifficulty,
      );

      goal = state.goal == goal ? goal : await goalRepository.update(goal);
    }

    emit(
      state.copyWith(
        isLoading: false,
        goal: goal,
      ),
    );
  }
}
