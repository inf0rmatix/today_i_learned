import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/goals/models/models.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';

part 'edit_goal_cubit.freezed.dart';
part 'edit_goal_state.dart';

class EditGoalCubit extends Cubit<EditGoalState> {
  final GoalRepository goalRepository;

  // TODO(inf0rmatix): add autosave for valid states. DEFINITELY :) Streamchat approved
  EditGoalCubit({
    String? goalUid,
    required this.goalRepository,
  }) : super(
          EditGoalState(
            editingGoal: GoalModel(
              uid: 'new',
              title: '',
              created: DateTime.now(),
              deadline: DateTime.now(),
            ),
          ),
        ) {
    _initialize(goalUid);
  }

  void changeTitle(String title) {
    emit(
      state.copyWith(
        editingGoal: state.editingGoal.copyWith(title: title),
      ),
    );
  }

  void changeDeadline(DateTime deadline) {
    emit(
      state.copyWith(
        editingGoal: state.editingGoal.copyWith(deadline: deadline),
      ),
    );
  }

  void changeRequiredLearnings(int requiredLearnings) {
    emit(
      state.copyWith(
        editingGoal: state.editingGoal.copyWith(requiredLearnings: requiredLearnings),
      ),
    );
  }

  void changeRequiredDifficulty(double requiredDifficulty) {
    emit(
      state.copyWith(
        editingGoal: state.editingGoal.copyWith(requiredDifficulty: requiredDifficulty),
        previousRequiredDifficulty: requiredDifficulty,
      ),
    );
  }

  void toggleIsDifficultyRequirementEnabled() {
    final isDifficultyRequirementEnabled = !state.isDifficultyRequirementEnabled;

    emit(
      state.copyWith(
        isDifficultyRequirementEnabled: isDifficultyRequirementEnabled,
        editingGoal: state.editingGoal.copyWith(
          requiredDifficulty: isDifficultyRequirementEnabled
              ? state.previousRequiredDifficulty
              : GoalModel.noDifficultyRequirementValue,
        ),
      ),
    );
  }

  Future<void> save() async {
    emit(state.copyWith(isLoading: true));

    GoalModel? goal = state.goal;

    goal = goal == null
        ? await goalRepository.create(state.editingGoal)
        : goal == state.editingGoal
            ? goal
            : await goalRepository.update(state.editingGoal);

    emit(
      state.copyWith(
        isLoading: false,
        goal: goal,
        editingGoal: goal,
      ),
    );
  }

  Future<void> _initialize(String? goalUid) async {
    if (goalUid == null) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final goal = await goalRepository.findOne(goalUid);
    final editingGoal = goal ?? state.editingGoal;

    emit(
      state.copyWith(
        isLoading: false,
        goal: goal,
        editingGoal: editingGoal,
        // ignore: no-magic-number
        isChangingRequirementsDisabled: editingGoal.learnings > 0,
        isDifficultyRequirementEnabled: editingGoal.requiredDifficulty != GoalModel.noDifficultyRequirementValue,
      ),
    );
  }
}
