import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/create_learning/blocs/blocs.dart';

class CreateLearningPage extends StatelessWidget {
  const CreateLearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateLearningCubit(
        learningRepository: context.read<LearningRepository>(),
      ),
      child: const _CreateLearningPageView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _CreateLearningPageView extends StatelessWidget {
  const _CreateLearningPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today I learned'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.L),
              children: [
                const Text('What did you learn?'),
                const SizedBox(height: AppSpacing.L),
                CustomTextFormField(
                  label: 'Title',
                  onChanged: (title) => context.read<CreateLearningCubit>().changeTitle(title),
                ),
                const SizedBox(height: AppSpacing.L),
                CustomTextFormField.multiline(
                  label: 'Description',
                  onChanged: (description) => context.read<CreateLearningCubit>().changeDescription(description),
                ),
                const SizedBox(height: AppSpacing.L),
                CustomTextFormField(
                  label: 'Difficulty',
                  onChanged: (description) => context.read<CreateLearningCubit>().changeDifficulty(description),
                ),
                const SizedBox(height: AppSpacing.L),
                CustomTextFormField(
                  label: 'Category',
                  onChanged: (description) => context.read<CreateLearningCubit>().changeCategory(description),
                ),
                const SizedBox(height: AppSpacing.L),
                ElevatedButton.icon(
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save'),
                  onPressed: () => context.read<CreateLearningCubit>().save(),
                ),
              ],
            ),
          ),
          BlocSelector<CreateLearningCubit, CreateLearningState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.blue.withAlpha(AppAlpha.a200),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
