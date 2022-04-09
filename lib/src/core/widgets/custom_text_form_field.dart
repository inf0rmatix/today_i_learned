import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    Key? key,
    required String label,
    void Function(String)? onChanged,
  }) : super(
          key: key,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
          ),
          onChanged: onChanged,
        );
}
