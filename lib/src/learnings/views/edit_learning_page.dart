import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/categories.dart';
import 'package:today_i_learned/src/goals/goals.dart';
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
        goalsCubit: context.read<GoalsCubit>(),
      ),
      child: _CreateLearningPageView(),
    );
  }
}

class _CreateLearningPageView extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();

  _CreateLearningPageView({Key? key}) : super(key: key);

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
            child: Form(
              key: _form,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.L,
                  horizontal: AppSpacing.L,
                ),
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
                        validator: RequiredValidator(errorText: 'Title is required'),
                        onChanged: (title) => context.read<EditLearningCubit>().changeTitle(title),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  BlocBuilder<EditLearningCubit, EditLearningState>(
                    buildWhen: (previousState, newState) => previousState.learning != newState.learning,
                    builder: (context, state) {
                      return CustomTextFormField.multiline(
                        key: Key('${state.learning?.description?.length.toString() ?? ''}-description'),
                        label: 'Description',
                        initialValue: state.description,
                        onChanged: (description) => context.read<EditLearningCubit>().changeDescription(description),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.L),
                  Row(
                    children: [
                      Expanded(
                        child: BlocSelector<CategoriesCubit, CategoriesState, List<CategoryModel>>(
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
                                  label: 'Category (optional)',
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.M),
                      IconButton(
                        onPressed: () => _addCategory(context),
                        icon: const Icon(Icons.add_rounded),
                      ),
                    ],
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

  Future<void> _save(BuildContext context) async {
    final isValid = _form.currentState?.validate() ?? false;

    if (isValid) {
      FocusScope.of(context).unfocus();

      await context.read<EditLearningCubit>().save();
    }
  }

  void _addCategory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateCategoryDialog(),
    );
  }
}
