import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/all_learnings/blocs/learnings/learnings_cubit.dart';
import 'package:today_i_learned/src/core/core.dart';

class AllLearningsPage extends StatelessWidget {
  const AllLearningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningsCubit(
        learningRepository: context.read<LearningRepository>(),
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
              child: BlocSelector<LearningsCubit, LearningsState, List<LearningModel>>(
                selector: (state) => state.learnings,
                builder: (context, learnings) => ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.M),
                  itemCount: learnings.length,
                  itemBuilder: (context, index) {
                    var learning = learnings[index];

                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.emoji_events_outlined,
                              size: AppIconSize.L,
                            ),
                            title: Text(learning.title),
                            subtitle: Text(
                              '${learning.created.formatWeekdayDate(context.locale)} - Difficulty-Level: ${learning.difficulty}',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.M,
                              right: AppSpacing.M,
                              bottom: AppSpacing.M,
                            ),
                            child: Text(learning.description.truncate(AppConfig.learningDescriptionPreviewLength)),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.M),
                ),
              ),
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
