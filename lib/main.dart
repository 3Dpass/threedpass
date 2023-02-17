import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/core/theme/d3p_appbar_theme.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/theme_builder.dart';
import 'package:threedpass/features/app/presentation/global_states_provider.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart' as di_setup;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hive_setup.hiveSetup();
  await di_setup.setup();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('sr'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ThreeDApp(),
    ),
  );
}

class ThreeDApp extends StatelessWidget {
  ThreeDApp({final Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return GlobalStatesProvider(
      builder: (final BuildContext __) => ThemeBuilder(
        builder: (final BuildContext context, final Brightness brightness) {
          return PlatformApp.router(
            debugShowCheckedModeBanner: false,
            title: '3Dpass',
            material: _MainMaterialAppRouterData(brightness).theme,
            cupertino: _MainCupertinoAppRouterData(brightness).theme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}

class _MainMaterialAppRouterData {
  final Brightness brightness;

  _MainMaterialAppRouterData(this.brightness);

  MaterialAppRouterData theme(
    final BuildContext context,
    final PlatformTarget platform,
  ) {
    return MaterialAppRouterData(
      theme: D3pThemeData.themeData(brightness),
      darkTheme: D3pThemeData.darkTheme,
      themeMode:
          brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
    );
  }
}

class _MainCupertinoAppRouterData {
  final Brightness brightness;

  _MainCupertinoAppRouterData(this.brightness);

  CupertinoAppRouterData theme(
    final BuildContext context,
    final PlatformTarget platform,
  ) {
    final mainTheme = brightness == Brightness.light
        ? D3pThemeData.lightTheme
        : D3pThemeData.darkTheme;

    return CupertinoAppRouterData(
      color: D3pThemeData.mainColor,
      theme: CupertinoThemeData(
        primaryColor: D3pThemeData.mainColor,
        primaryContrastingColor: mainTheme.colorScheme.onPrimary,
        brightness: brightness,
        barBackgroundColor: const D3pAppBarTheme().backgroundColor,
      ),
    );
  }
}
