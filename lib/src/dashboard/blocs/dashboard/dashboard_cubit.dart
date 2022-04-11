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

    emit(
      state.copyWith(
        learnings: learnings,
        mostRecentLearnings: mostRecentLearnings,
        isLoading: false,
        // TODO(1nf0rmatix): remove mock values.
        // ignore: no-magic-number
        learningsPastMonth: 42,
        // ignore: no-magic-number
        learningsPastSevenDays: 5,
      ),
    );
  }

  void reload() {
    _initialize();
  }
}
