import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:today_i_learned/src/app/repositories/repositories.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/learnings/models/models.dart';
import 'package:today_i_learned/src/learnings/repositories/repositories.dart';

part 'learnings_cubit.freezed.dart';
part 'learnings_state.dart';

class LearningsCubit extends Cubit<LearningsState> {
  final LearningRepository learningRepository;

  final CategoriesCubit categoriesCubit;

  late StreamSubscription _changesStreamSubscription;

  LearningsCubit({
    required this.learningRepository,
    required this.categoriesCubit,
  }) : super(const LearningsState()) {
    _initialize();
  }

  Future _initialize() async {
    emit(state.copyWith(isLoading: true));

    final learnings = await learningRepository.findAll();

    emit(state.copyWith(isLoading: false, learnings: learnings));

    _changesStreamSubscription = learningRepository.changes.listen(_onEntityChangedEvent);

    sortLearnings(state.learningOrderBy);
  }

  void nextOrdering() {
    var learningOrderByIndex = state.learningOrderBy.index;

    learningOrderByIndex++;

    // ignore: no-magic-number
    learningOrderByIndex = learningOrderByIndex >= LearningOrderBy.values.length ? 0 : learningOrderByIndex;

    final learningOrderBy = LearningOrderBy.values[learningOrderByIndex];

    sortLearnings(learningOrderBy);
  }

  void sortLearnings(LearningOrderBy learningOrderBy) {
    final learnings = state.learnings;

    final sortedLearnings = List.generate(
      learnings.length,
      (index) => LearningWithCategory(
        learning: learnings[index],
        category: categoriesCubit.findByUid(learnings[index].category),
      ),
    );

    switch (learningOrderBy) {
      case LearningOrderBy.createdDescending:
        sortedLearnings.sort((a, b) => b.learning.created.compareTo(a.learning.created));
        break;

      case LearningOrderBy.createdAscending:
        sortedLearnings.sort((a, b) => a.learning.created.compareTo(b.learning.created));
        break;

      case LearningOrderBy.categoryDescending:
        // ignore: no-magic-number
        sortedLearnings.sort((a, b) => a.category?.name.compareTo(b.category?.name ?? '') ?? 0);
        break;

      case LearningOrderBy.categoryAscending:
        // ignore: no-magic-number
        sortedLearnings.sort((a, b) => b.category?.name.compareTo(a.category?.name ?? '') ?? 0);
        break;

      case LearningOrderBy.difficultyAscending:
        sortedLearnings.sort((a, b) => a.learning.difficulty.compareTo(b.learning.difficulty));
        break;

      case LearningOrderBy.difficultyDescending:
        sortedLearnings.sort((a, b) => b.learning.difficulty.compareTo(a.learning.difficulty));
        break;
      default:
        break;
    }

    emit(
      state.copyWith(
        sortedLearnings: sortedLearnings,
        learningOrderBy: learningOrderBy,
      ),
    );
  }

  void changeOrderBy(LearningOrderBy learningOrderBy) {
    sortLearnings(learningOrderBy);
  }

  void _onEntityChangedEvent(EntityChangedEvent<LearningModel> event) {
    switch (event.type) {
      case EntityChangedEventType.created:
        emit(state.copyWith(learnings: state.learnings.toList()..add(event.object)));
        break;
      case EntityChangedEventType.updated:
        emit(
          state.copyWith(
            learnings: state.learnings.toList()
              ..removeWhere((element) => element.uid == event.object.uid)
              ..add(event.object),
          ),
        );
        break;
      case EntityChangedEventType.deleted:
        emit(
          state.copyWith(
            learnings: state.learnings.toList()..removeWhere((element) => element.uid == event.object.uid),
          ),
        );
        break;
    }

    sortLearnings(state.learningOrderBy);
  }
}

enum LearningOrderBy {
  createdDescending,
  createdAscending,
  difficultyDescending,
  difficultyAscending,
  categoryDescending,
  categoryAscending,
}

class LearningWithCategory {
  final LearningModel learning;
  final CategoryModel? category;

  LearningWithCategory({
    required this.learning,
    required this.category,
  });
}
