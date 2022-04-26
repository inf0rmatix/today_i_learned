import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';

class CategoryCard extends StatefulWidget {
  final CategoryModel category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isEditing = false;
  bool isLoading = false;
  String newName = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.goNamed(
          AppRoutes.categoryDetails,
          params: {'categoryUid': widget.category.uid},
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.M),
          child: Column(
            children: [
              ListTile(
                title: isEditing
                    ? Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              label: 'Name',
                              initialValue: widget.category.name,
                              enabled: !isLoading,
                              onChanged: (name) => setState(() => newName = name),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.save_rounded),
                            onPressed: isLoading ? null : () => _save(context),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          CustomText.headline1(widget.category.name),
                          IconButton(
                            onPressed: () => setState(() => isEditing = true),
                            icon: const Icon(Icons.edit_rounded),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context) {
    setState(() {
      isLoading = true;
    });

    final categoryRepository = context.read<CategoryRepository>();

    categoryRepository.update(widget.category.copyWith(name: newName));
  }
}
