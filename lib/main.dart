import 'dart:ffi';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/persistence/hive_setup.dart' as hive_setup;
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/generated/bindings.dart';
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

  void testLib() {
    final DynamicLibrary nativeExampleLib = Platform.isAndroid
        ? DynamicLibrary.open(
            "libcalc.so") // Load the dynamic library on Android
        : DynamicLibrary.process(); // Load the static library on iOS

    // final bindings = GreeterBindings(nativeExampleLib);

    final Pointer<Utf8> Function(Pointer<Utf8>) rustGreeting = nativeExampleLib
        .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Utf8>)>>(
            "rust_greeting")
        .asFunction();

    // Prepare the parameters
    final name = "John Smith";
    final Pointer<Utf8> namePtr = name.toNativeUtf8();
    print("- Calling rust_greeting with argument:  $namePtr");

// Call rust_greeting
    final Pointer<Utf8> resultPtr = rustGreeting(namePtr);
    print("- Result pointer:  $resultPtr");

    final String greetingStr = resultPtr.toDartString();
    print("- Response string:  $greetingStr");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    testLib();

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
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
