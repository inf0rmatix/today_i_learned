import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/goals/models/goal/goal_model.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';

part 'goal_details_cubit.freezed.dart';
part 'goal_details_state.dart';

class GoalDetailsCubit extends Cubit<GoalDetailsState> {
  final GoalRepository goalRepository;

  GoalDetailsCubit({
    required String goalUid,
    required this.goalRepository,
  }) : super(GoalDetailsState(goalUid: goalUid)) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));

    final goal = await goalRepository.findOne(state.goalUid);

    emit(
      state.copyWith(
        isLoading: false,
        goal: goal,
      ),
    );
  }
}
