import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/blocs/edit_category/edit_category_cubit.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';

class CreateCategoryDialog extends StatelessWidget {
  const CreateCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCategoryCubit(
        categoryRepository: context.read<CategoryRepository>(),
      ),
      child: _CreateCategoryDialogView(),
    );
  }
}

// ignore: prefer-single-widget-per-file
class _CreateCategoryDialogView extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();

  _CreateCategoryDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.L),
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(AppSpacing.M),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.M,
                    vertical: AppSpacing.XL,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomText.headline1('Edit Category'),
                      const SizedBox(height: AppSpacing.L),
                      CustomTextFormField(
                        label: 'Name',
                        onChanged: (name) => context.read<EditCategoryCubit>().changeName(name),
                        validator: RequiredValidator(errorText: 'name is required'),
                      ),
                      const SizedBox(height: AppSpacing.L),
                      ElevatedButton.icon(
                        onPressed: () => _save(context),
                        icon: const Icon(Icons.save_rounded),
                        label: const Text('Save'),
                      ),
                    ],
                  ),
                ),
                BlocSelector<EditCategoryCubit, EditCategoryState, bool>(
                  selector: (state) => state.isLoading,
                  builder: (context, isLoading) => isLoading
                      ? Positioned.fill(
                          child: Container(
                            color: Colors.black38,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    final isValid = _form.currentState?.validate() ?? false;

    if (isValid) {
      await context.read<EditCategoryCubit>().save();

      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
