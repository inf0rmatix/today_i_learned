import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/config/app_colors.dart';

class CustomDropdownButtonFormField<T> extends DropdownButtonFormField<T> {
  CustomDropdownButtonFormField({
    Key? key,
    required List<DropdownMenuItem<T>>? items,
    required ValueChanged<T?>? onChanged,
    String? label,
    T? value,
  }) : super(
          key: key,
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            label: label == null ? null : Text(label),
          ),
          iconEnabledColor: AppColors.seashell,
        );
}
