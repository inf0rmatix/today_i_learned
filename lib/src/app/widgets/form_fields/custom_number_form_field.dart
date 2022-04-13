import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberFormField extends TextFormField {
  CustomNumberFormField({
    Key? key,
    required String label,
    void Function(num)? onChanged,
    num? initialValue,
    String? Function(String? value)? validator,
  }) : super(
          key: key,
          decoration: InputDecoration(
            label: Text(label),
          ),
          initialValue: initialValue?.toString(),
          onChanged: (value) => _onChanged(value, onChanged),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[1-9][0-9]*')),
          ],
          keyboardType: TextInputType.number,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );

  static void _onChanged(String? text, void Function(num)? onChanged) {
    if (text == null || onChanged == null) {
      return;
    }

    final value = num.tryParse(text);

    if (value != null) {
      onChanged(value);
    }
  }
}
