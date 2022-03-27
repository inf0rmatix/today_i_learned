import 'package:easy_localization/easy_localization.dart';

extension TranslationExtension on String {
  String translate({
    List<String>? arguments,
    Map<String, String>? namedArguments,
    String? gender,
  }) {
    return this.tr(args: arguments, namedArgs: namedArguments, gender: gender);
  }
}
