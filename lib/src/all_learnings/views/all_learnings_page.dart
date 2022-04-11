import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/all_learnings/blocs/learnings/learnings_cubit.dart';
import 'package:today_i_learned/src/all_learnings/widgets/widgets.dart';
import 'package:today_i_learned/src/core/core.dart';

class AllLearningsPage extends StatelessWidget {
  const AllLearningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningsCubit(
        learningRepository: context.read<LearningRepository>(),
        categoriesCubit: context.read<CategoriesCubit>(),
      ),
      child: const _AllLearningsView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _AllLearningsView extends StatelessWidget {
  const _AllLearningsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Learnings'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.M),
              child: BlocBuilder<LearningsCubit, LearningsState>(
                buildWhen: (oldState, newState) =>
                    oldState.learningOrderBy != newState.learningOrderBy ||
                    oldState.sortedLearnings != newState.sortedLearnings,
                builder: (context, state) => ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.M),
                  itemCount: state.learnings.length,
                  itemBuilder: (context, index) {
                    final learningWithCategory = state.sortedLearnings[index];
                    final learning = learningWithCategory.learning;
                    final category = learningWithCategory.category;

                    return LearningsListElement(
                      learning: learning,
                      category: category,
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.M),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppSpacing.XL,
            right: AppSpacing.XL,
            child: BlocSelector<LearningsCubit, LearningsState, LearningOrderBy>(
              selector: (state) => state.learningOrderBy,
              builder: (context, learningOrderBy) {
                return LearningsSortingSelection(
                  value: learningOrderBy,
                  onChanged: (learningOrderBy) => context.read<LearningsCubit>().changeOrderBy(learningOrderBy),
                );
              },
            ),
          ),
          BlocSelector<LearningsCubit, LearningsState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, isLoading) => isLoading
                ? Positioned.fill(
                    child: Container(
                      color: Theme.of(context).backgroundColor.withAlpha(AppAlpha.a200),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
