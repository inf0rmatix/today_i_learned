import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class EditLearningPage extends StatelessWidget {
  final String? learningUid;

  const EditLearningPage({
    Key? key,
    this.learningUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditLearningCubit(
        learningUid: learningUid,
        learningRepository: context.read<LearningRepository>(),
        categoriesCubit: context.read<CategoriesCubit>(),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_rounded),
        onPressed: () => _save(context),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.L),
              children: [
                const CustomText.headline1('What did you learn?'),
                const SizedBox(height: AppSpacing.L),
                BlocBuilder<EditLearningCubit, EditLearningState>(
                  buildWhen: (previousState, newState) => previousState.learning != newState.learning,
                  builder: (context, state) {
                    return CustomTextFormField(
                      key: Key('${state.learning?.title.length.toString() ?? ''}-title'),
                      label: 'Title',
                      initialValue: state.title,
                      onChanged: (title) => context.read<EditLearningCubit>().changeTitle(title),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                BlocBuilder<EditLearningCubit, EditLearningState>(
                  buildWhen: (previousState, newState) => previousState.learning != newState.learning,
                  builder: (context, state) {
                    return CustomTextFormField.multiline(
                      key: Key('${state.learning?.description.length.toString() ?? ''}-description'),
                      label: 'Description',
                      initialValue: state.description,
                      onChanged: (description) => context.read<EditLearningCubit>().changeDescription(description),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                BlocSelector<CategoriesCubit, CategoriesState, List<CategoryModel>>(
                  selector: (state) => state.categories,
                  builder: (context, categories) {
                    return BlocSelector<EditLearningCubit, EditLearningState, CategoryModel?>(
                      selector: (state) => state.category,
                      builder: (context, selectedCategory) {
                        return CustomDropdownButtonFormField<CategoryModel>(
                          value: selectedCategory,
                          items: List.generate(
                            categories.length,
                            (index) => DropdownMenuItem(
                              value: categories[index],
                              child: Text(categories[index].name),
                            ),
                          ),
                          onChanged: (category) => context.read<EditLearningCubit>().changeCategory(category),
                          label: 'Category',
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                const CustomText('How hard was it? 0 - super easy, 10 - super hard'),
                BlocSelector<EditLearningCubit, EditLearningState, double>(
                  selector: (state) => state.difficulty,
                  builder: (context, difficulty) => CustomSlider(
                    // ignore: avoid_redundant_argument_values
                    min: AppConfig.difficultyMinimum,
                    max: AppConfig.difficultyMaximum,
                    divisions: AppConfig.difficultyDivisions,
                    value: difficulty,
                    // ignore: no-magic-number
                    label: difficulty.toStringAsFixed(1),
                    onChanged: (value) => context.read<EditLearningCubit>().changeDifficulty(value),
                  ),
                ),
                const SizedBox(height: AppSpacing.XXXL),
              ],
            ),
          ),
          BlocSelector<EditLearningCubit, EditLearningState, bool>(
            selector: (state) => state.isLoading,
            builder: (context, isLoading) {
              if (isLoading) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black26,
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

  void _save(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<EditLearningCubit>().save();
  }
}
