import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/extensions/extensions.dart';
import 'package:today_i_learned/src/core/widgets/form_fields/custom_text_form_field.dart';

class CustomDateFormField extends StatelessWidget {
  final String label;
  final DateTime? initialValue;
  final void Function(DateTime date)? onChanged;

  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey();

  CustomDateFormField({
    Key? key,
    required this.label,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: AbsorbPointer(
        child: CustomTextFormField(
          key: _formFieldKey,
          label: label,
          initialValue: initialValue?.formatFullDate(context.locale),
        ),
      ),
    );
  }

  Future _onTap(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();

    final newDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 4 * 365)),
    );

    if (newDate == null || onChanged == null) {
      return;
    }

    onChanged!(newDate);
    _formFieldKey.currentState?.didChange(newDate.formatFullDate(context.locale));
  }
}
