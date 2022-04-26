import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_i_learned/src/app/config/config.dart';
import 'package:today_i_learned/src/categories/categories.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.create_rounded),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const CreateCategoryDialog(),
        ),
      ),
      body: BlocSelector<CategoriesCubit, CategoriesState, List<CategoryModel>>(
        selector: (state) => state.categories,
        builder: (context, categories) {
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.M),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return CategoryCard(
                key: Key(category.name + category.uid),
                category: category,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.M),
          );
        },
      ),
    );
  }
}
