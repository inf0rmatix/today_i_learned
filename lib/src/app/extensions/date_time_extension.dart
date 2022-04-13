import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:today_i_learned/src/app/app.dart';

extension DateTimeExtension on DateTime {
  String formatWeekdayDate(Locale locale) {
    return DateFormat(
      LocaleKeys.common_date_format_weekday_date.translate(),
      locale.languageCode,
    ).format(this);
  }

  String formatFullDate(Locale locale) {
    return DateFormat(
      LocaleKeys.common_date_format_full_date.translate(),
      locale.languageCode,
    ).format(this);
  }
}
