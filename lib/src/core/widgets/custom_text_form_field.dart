import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  static const _multilineMinLines = 5;
  static const _multilineMaxLines = 42;

  CustomTextFormField({
    Key? key,
    required String label,
    void Function(String)? onChanged,
    int? minLines,
    String? Function(String?)? validator,
  }) : super(
          key: key,
          decoration: InputDecoration(
            label: Text(label),
          ),
          onChanged: onChanged,
          minLines: minLines,
          maxLines: minLines != null ? _multilineMaxLines : null,
          validator: validator,
        );

  factory CustomTextFormField.multiline({
    Key? key,
    required String label,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
  }) =>
      CustomTextFormField(
        key: key,
        label: label,
        onChanged: onChanged,
        minLines: _multilineMinLines,
        validator: validator,
      );
}
