import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/goals/models/goal/goal_model.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';

part 'goal_details_cubit.freezed.dart';
part 'goal_details_state.dart';

class GoalDetailsCubit extends Cubit<GoalDetailsState> {
  final GoalRepository goalRepository;
  final CategoryRepository categoryRepository;

  GoalDetailsCubit({
    required String goalUid,
    required this.goalRepository,
    required this.categoryRepository,
  }) : super(GoalDetailsState(goalUid: goalUid)) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(state.copyWith(isLoading: true));

    final goal = await goalRepository.findOne(state.goalUid);
    final category = goal?.category == null ? null : await categoryRepository.findOne(goal!.category!);

    emit(
      state.copyWith(
        isLoading: false,
        goal: goal,
        category: category,
      ),
    );
  }
}
