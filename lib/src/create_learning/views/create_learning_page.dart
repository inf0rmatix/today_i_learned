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
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.L),
              children: [
                const CustomText.headline1('What did you learn?'),
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
                BlocSelector<CategoriesCubit, CategoriesState, List<CategoryModel>>(
                  selector: (state) => state.categories,
                  builder: (context, categories) {
                    return BlocSelector<CreateLearningCubit, CreateLearningState, CategoryModel?>(
                      selector: (state) => state.category,
                      builder: (context, selectedCategory) {
                        return CustomDropdownButtonFormField<CategoryModel>(
                          value: selectedCategory,
                          items: List.generate(
                            categories.length,
                            (index) => DropdownMenuItem(
                              child: Text(categories[index].name),
                              value: categories[index],
                            ),
                          ),
                          onChanged: (category) => context.read<CreateLearningCubit>().changeCategory(category),
                          label: 'Category',
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.L),
                const CustomText('How hard was it? 0 - super easy, 10 - super hard'),
                BlocSelector<CreateLearningCubit, CreateLearningState, double>(
                  selector: (state) => state.difficulty,
                  builder: (context, difficulty) => CustomSlider(
                    // ignore: avoid_redundant_argument_values
                    min: AppConfig.difficultyMinimum,
                    max: AppConfig.difficultyMaximum,
                    divisions: AppConfig.difficultyDivisions,
                    value: difficulty,
                    // ignore: no-magic-number
                    label: difficulty.toStringAsFixed(1),
                    onChanged: (value) => context.read<CreateLearningCubit>().changeDifficulty(value),
                  ),
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
