import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/core/core.dart';

part 'learnings_cubit.freezed.dart';
part 'learnings_state.dart';

class LearningsCubit extends Cubit<LearningsState> {
  final LearningRepository learningRepository;

  LearningsCubit({
    required this.learningRepository,
  }) : super(const LearningsState()) {
    _initialize();
  }

  void _initialize() async {
    emit(state.copyWith(isLoading: true));

    var learnings = await learningRepository.findAll();

    emit(state.copyWith(isLoading: false, learnings: learnings));
  }
}
