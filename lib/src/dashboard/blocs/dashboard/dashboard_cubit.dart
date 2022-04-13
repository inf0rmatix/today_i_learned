import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  static const int _mostRecentLearningsCount = 3;

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

    final learnings = await learningRepository.findAll();

    learnings.sort((a, b) => b.created.compareTo(a.created));

    final mostRecentLearningsCount =
        learnings.length > _mostRecentLearningsCount ? _mostRecentLearningsCount : learnings.length;

    final mostRecentLearnings = learnings.sublist(0, mostRecentLearningsCount);

    final now = DateTime.now();

    final pastThirtyDaysLearnings =
        learnings.where((learning) => learning.created.difference(now).inDays.abs() <= 30).length;

    final pastSevenDaysLearnings =
        learnings.where((learning) => learning.created.difference(now).inDays.abs() <= 7).length;

    final learningsLast90Days =
        learnings.where((learning) => learning.created.difference(now).inDays.abs() <= 90).toList();
    learningsLast90Days.sort((a, b) => b.difficulty.compareTo(a.difficulty));

    emit(
      state.copyWith(
        learnings: learnings,
        mostRecentLearnings: mostRecentLearnings,
        isLoading: false,
        learningsPastThirtyDays: pastThirtyDaysLearnings,
        learningsPastSevenDays: pastSevenDaysLearnings,
        mostDifficultLearningPast90Days: learningsLast90Days.isEmpty ? null : learningsLast90Days.first,
      ),
    );
  }

  void reload() {
    _initialize();
  }
}
