import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  static const _multilineMinLines = 5;
  static const _multilineMaxLines = 42;

  CustomTextFormField({
    Key? key,
    required String label,
    void Function(String)? onChanged,
    int? minLines,
  }) : super(
          key: key,
          decoration: InputDecoration(
            label: Text(label),
          ),
          onChanged: onChanged,
          minLines: minLines,
          maxLines: minLines != null ? _multilineMaxLines : null,
        );

  factory CustomTextFormField.multiline({
    Key? key,
    required String label,
    void Function(String)? onChanged,
  }) =>
      CustomTextFormField(
        key: key,
        label: label,
        onChanged: onChanged,
        minLines: _multilineMinLines,
      );
}
