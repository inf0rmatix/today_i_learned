import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/models/learning_model.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final LearningRepository learningRepository;

  DashboardCubit({
    required this.learningRepository,
  }) : super(const DashboardState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    var learnings = await learningRepository.findAll();

    emit(
      state.copyWith(
        learnings: learnings,
        isLoading: false,
      ),
    );
  }

  reload() {
    _initialize();
  }
}
