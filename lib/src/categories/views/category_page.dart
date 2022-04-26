import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/app/config/config.dart';
import 'package:today_i_learned/src/categories/blocs/category_details/category_details_cubit.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class CategoryPage extends StatelessWidget {
  final String categoryUid;

  const CategoryPage({
    Key? key,
    required this.categoryUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDetailsCubit(
        categoryUid: categoryUid,
        categoryRepository: context.read<CategoryRepository>(),
        learningRepository: context.read<LearningRepository>(),
      ),
      child: const _CategoryView(),
    );
  }
}

class _CategoryView extends StatelessWidget {
  const _CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocSelector<CategoryDetailsCubit, CategoryDetailsState, String>(
          selector: (state) => state.category?.name ?? 'Loading...',
          builder: (context, name) => Text(name),
        ),
      ),
      body: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
        buildWhen: (oldState, newState) => oldState.learnings != newState.learnings,
        builder: (context, state) => ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.M),
          itemCount: state.learnings.length,
          itemBuilder: (context, index) => LearningsListElement(
            learning: state.learnings[index],
            category: state.category,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.M),
        ),
      ),
    );
  }
}
