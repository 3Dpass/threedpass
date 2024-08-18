import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/app/presentation/app_error_widget.dart';
import 'package:threedpass/router/router.dart';

class D3pApp extends StatelessWidget {
  final Brightness brightness;
  final RootRouter rootRouter;

  const D3pApp({required this.brightness, required this.rootRouter, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Implement cupertino theme
    // if (Platform.isIOS) {
    //   return CupertinoApp.router(
    //     debugShowCheckedModeBanner: false,
    //     title: '3Dpass',
    //     builder: (final context, final widget) {
    //       ErrorWidget.builder = (final errorDetails) => AppErrorWidget(
    //             errorDetails: errorDetails,
    //             isScaffold: widget is Scaffold || widget is Navigator,
    //           );
    //       if (widget != null) return widget;
    //       throw StateError('widget is null');
    //     },
    //     theme: D3pThemeData.themeData(brightness),
    //     routerDelegate: _appRouter.delegate(),
    //     routeInformationParser: _appRouter.defaultRouteParser(),
    //     localizationsDelegates: context.localizationDelegates,
    //     supportedLocales: context.supportedLocales,
    //     locale: context.locale,
    //   );
    // } else {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: '3Dpass',
      builder: (final context, final widget) {
        ErrorWidget.builder = (final errorDetails) => AppErrorWidget(
              errorDetails: errorDetails,
              isScaffold: widget is Scaffold || widget is Navigator,
            );
        if (widget != null) return widget;
        throw StateError('widget is null');
      },
      theme: D3pThemeData.themeData(brightness),
      routerDelegate: rootRouter.delegate(),
      routeInformationParser: rootRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
    // }
  }
}

//  CupertinoThemeData(
//         primaryColor: D3pThemeData.mainColor,
//         primaryContrastingColor: mainTheme.colorScheme.onPrimary,
//         brightness: brightness,
//         barBackgroundColor: mainTheme.customColors.scaffoldBackground,
//         scaffoldBackgroundColor: mainTheme.customColors.scaffoldBackground,
//       ),