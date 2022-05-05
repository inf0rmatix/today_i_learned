import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WidgetTestWrapper extends StatelessWidget {
  final Widget child;

  const WidgetTestWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      startLocale: const Locale('en'),
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Builder(
        builder: (context) => MaterialApp(
          home: child,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
