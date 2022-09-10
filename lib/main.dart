import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:flutter/material.dart';
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
  ThreeDApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<HashesListBloc>(
          create: (_) => di_setup.getIt<HashesListBloc>(),
        ),
        BlocProvider<SettingsConfigCubit>(
          create: (_) => di_setup.getIt<SettingsConfigCubit>(),
        ),
        BlocProvider<AppServiceLoaderCubit>(
          create: (_) => di_setup.getIt<AppServiceLoaderCubit>(),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        title: '3D pass',
        theme: D3pThemeData.lightTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
