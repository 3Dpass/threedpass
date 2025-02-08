import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/app/presentation/app_error_widget.dart';
import 'package:threedpass/router/router.dart';

class D3pPlatformApp extends StatelessWidget {
  final Brightness brightness;
  final RootRouter rootRouter;

  const D3pPlatformApp({
    required this.brightness,
    required this.rootRouter,
    super.key,
  });

  Widget errorBuilder(final BuildContext _, final Widget? widget) {
    ErrorWidget.builder = (final errorDetails) => AppErrorWidget(
          errorDetails: errorDetails,
          isScaffold: widget is Scaffold || widget is Navigator,
        );
    if (widget != null) return widget;
    throw StateError('widget is null');
  }

  static const title = '3Dpass';

  @override
  Widget build(final BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp.router(
        routeInformationParser: rootRouter.defaultRouteParser(),
        routerDelegate: rootRouter.delegate(),
        theme: D3pThemeData.cupertinoThemeData(brightness),
        builder: errorBuilder,
        title: title,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
      );
    } else {
      return MaterialApp.router(
        routeInformationParser: rootRouter.defaultRouteParser(),
        routerDelegate: rootRouter.delegate(),
        builder: errorBuilder,
        title: title,
        theme: D3pThemeData.themeData(brightness),
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
