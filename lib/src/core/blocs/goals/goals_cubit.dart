import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'goals_cubit.freezed.dart';
part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GoalRepository goalRepository;

  GoalsCubit({
    required this.goalRepository,
  }) : super(const GoalsState()) {
    fetchGoals();
  }

  Future<void> fetchGoals() async {
    emit(state.copyWith(isLoading: true));

    final goals = await goalRepository.findAll();

    emit(
      state.copyWith(
        isLoading: false,
        goals: goals,
      ),
    );
  }
}
