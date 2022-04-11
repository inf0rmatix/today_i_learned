import 'package:flutter/material.dart';
import 'package:today_i_learned/src/core/config/config.dart';

class CustomText extends Text {
  const CustomText(
    String data, {
    Key? key,
  }) : super(
          data,
          key: key,
        );

  const CustomText.headline1(
    String data, {
    Key? key,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            fontSize: AppFontSize.headline1,
          ),
        );

  const CustomText.headline2(
    String data, {
    Key? key,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            fontSize: AppFontSize.headline2,
          ),
        );

  const CustomText.headline3(
    String data, {
    Key? key,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            fontSize: AppFontSize.headline3,
          ),
        );

  const CustomText.headline4(
    String data, {
    Key? key,
  }) : super(
          data,
          key: key,
          style: const TextStyle(
            fontSize: AppFontSize.headline4,
          ),
        );

  const CustomText.subtitle(String data, {Key? key})
      : super(
          data,
          key: key,
          style: const TextStyle(
            fontSize: AppFontSize.subtitle,
            fontWeight: FontWeight.w200,
          ),
        );
}
