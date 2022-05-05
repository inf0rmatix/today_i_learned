import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/extensions/extensions.dart';
import 'package:today_i_learned/src/app/widgets/form_fields/custom_text_form_field.dart';

class CustomDateFormField extends StatefulWidget {
  final String label;
  final DateTime? initialValue;
  final void Function(DateTime date)? onChanged;
  final String? Function(String? value)? validator;

  const CustomDateFormField({
    Key? key,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomDateFormField> createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  final GlobalKey<FormFieldState<String>> _formFieldKey = GlobalKey();
  DateTime? currentValue;

  @override
  Widget build(BuildContext context) {
    final DateTime value = currentValue ?? widget.initialValue ?? DateTime.now();
    final enabled = widget.onChanged != null;

    return GestureDetector(
      onTap: enabled ? () => _onTap(context) : null,
      child: AbsorbPointer(
        child: CustomTextFormField(
          key: _formFieldKey,
          label: widget.label,
          initialValue: value.formatFullDate(context.locale),
          validator: widget.validator,
          enabled: enabled,
        ),
      ),
    );
  }

  Future _onTap(BuildContext context) async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();

    final newDate = await showDatePicker(
      context: context,
      initialDate: currentValue ?? widget.initialValue ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 4 * 365)),
    );

    if (newDate == null || widget.onChanged == null) {
      return;
    }

    widget.onChanged!(newDate);

    currentValue = newDate;

    _formFieldKey.currentState?.didChange(newDate.formatFullDate(context.locale));
  }
}
