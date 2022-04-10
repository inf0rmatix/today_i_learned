// ignore_for_file: no-magic-number

import 'package:flutter/material.dart';

class CustomSlider extends Slider {
  const CustomSlider({
    Key? key,
    required double value,
    required ValueChanged<double>? onChanged,
    double min = 0,
    double max = 1,
    int? divisions,
    String? label,
  }) : super(
          key: key,
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
          divisions: divisions,
          label: label,
        );
}
