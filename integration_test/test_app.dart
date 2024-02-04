import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/main.dart';

class TestApp {
  TestApp._();

  static final Widget instance = EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('es'),
      Locale('sr'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: ThreeDApp(),
  );
}
