import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:rust_lzss/rust_lzss.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/core/widgets/theme_builder.dart';
import 'package:threedpass/features/app/presentation/d3p_app.dart';
import 'package:threedpass/features/app/presentation/global_states_provider.dart';
import 'package:threedpass/router/router.dart';
import 'package:threedpass/setup.dart' as di_setup;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RustLib.init();
  await hive_setup.hiveSetup();
  await di_setup.setup();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: ThreeDApp(),
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('sr'),
        Locale('de'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
    ),
  );
}

class ThreeDApp extends StatelessWidget {
  ThreeDApp({final Key? key}) : super(key: key);

  final _appRouter = RootRouter();

  @override
  Widget build(final BuildContext context) {
    unawaited(
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]),
    );

    return GlobalStatesProvider(
      child: ThemeBuilder(
        builder: (final BuildContext context, final Brightness brightness) =>
            Phoenix(
          child: D3pPlatformApp(
            brightness: brightness,
            rootRouter: _appRouter,
          ),
        ),
      ),
    );
  }
}
