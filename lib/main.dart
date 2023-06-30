import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// import 'package:logger_flutter_plus/logger_flutter_plus.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/theme_builder.dart';
import 'package:threedpass/features/app/presentation/global_states_provider.dart';
import 'package:threedpass/router/router.dart';
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

// class CustomError extends StatelessWidget {
//   final FlutterErrorDetails errorDetails;

//   const CustomError({
//     Key? key,
//     required this.errorDetails,
//   })  : assert(errorDetails != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         child: Text(
//           errorDetails.exception.toString() +
//               '\n' +
//               errorDetails.library.toString() +
//               '\n' +
//               errorDetails.stack.toString(),
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         padding: const EdgeInsets.all(8.0),
//       ),
//       color: Colors.red,
//       margin: EdgeInsets.zero,
//     );
//   }
// }

class ThreeDApp extends StatelessWidget {
  ThreeDApp({final Key? key}) : super(key: key);

  final _appRouter = RootRouter();

  @override
  Widget build(final BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return GlobalStatesProvider(
      builder: (final BuildContext __) => ThemeBuilder(
        builder: (final BuildContext context, final Brightness brightness) =>
            Phoenix(
          child: PlatformApp.router(
            debugShowCheckedModeBanner: false,
            title: '3Dpass',
            // builder: (BuildContext context, Widget? widget) {
            //   ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            //     return CustomError(errorDetails: errorDetails);
            //   };

            //   return widget ??
            //       Material(
            //         child: Text('Error'),
            //       );
            // },
            material: _MainMaterialAppRouterData(brightness).theme,
            cupertino: _MainCupertinoAppRouterData(brightness).theme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
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
        barBackgroundColor: mainTheme.customColors.scaffoldBackground,
        scaffoldBackgroundColor: mainTheme.customColors.scaffoldBackground,
      ),
    );
  }
}
