import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class LearningDetailsPage extends StatelessWidget {
  final String uid;

  const LearningDetailsPage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningDetailsCubit(
        learningUid: uid,
        learningRepository: context.read<LearningRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      ),
      child: const _LearningDetailsView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _LearningDetailsView extends StatelessWidget {
  const _LearningDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<LearningDetailsCubit, LearningDetailsState, String>(
          selector: (state) => state.learning?.title ?? 'Loading...',
          builder: (context, title) => Text(
            title,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO(1nf0rmatix): implement editing learings (refactor create learning page)
        },
        child: const Icon(Icons.edit_rounded),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.M),
              children: [
                BlocSelector<LearningDetailsCubit, LearningDetailsState, String?>(
                  selector: (state) => state.category?.name,
                  builder: (context, categoryName) {
                    if (categoryName == null) {
                      return const SizedBox();
                    }

                    return ListTile(
                      leading: const Icon(Icons.folder_rounded),
                      title: Text(categoryName),
                      subtitle: const Text('Category'),
                    );
                  },
                ),
                BlocSelector<LearningDetailsCubit, LearningDetailsState, double?>(
                  selector: (state) => state.learning?.difficulty,
                  builder: (context, difficulty) {
                    return ListTile(
                      leading: const Icon(Icons.bolt_rounded),
                      title: Text('${difficulty ?? '...'}'),
                      subtitle: const Text('Difficulty'),
                    );
                  },
                ),
                BlocSelector<LearningDetailsCubit, LearningDetailsState, DateTime?>(
                  selector: (state) => state.learning?.created,
                  builder: (context, created) {
                    return ListTile(
                      leading: const Icon(Icons.event_available_rounded),
                      title: Text(created?.formatFullDate(context.locale) ?? '...'),
                      subtitle: const Text('Created'),
                    );
                  },
                ),
                BlocSelector<LearningDetailsCubit, LearningDetailsState, DateTime?>(
                  selector: (state) => state.learning?.updated,
                  builder: (context, updated) {
                    if (updated == null) {
                      return const SizedBox();
                    }

                    return ListTile(
                      leading: const Icon(Icons.edit_calendar_rounded),
                      title: Text(updated.formatFullDate(context.locale)),
                      subtitle: const Text('Updated'),
                    );
                  },
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.description_rounded),
                        title: Text('Description'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.M),
                        child: BlocSelector<LearningDetailsCubit, LearningDetailsState, String>(
                          selector: (state) => state.learning?.description ?? 'Loading...',
                          builder: (context, description) => Text(
                            description,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.XXXL),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
