import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/home_page/presentation/pages/home_page.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:threedpass/setup.dart' as di_setup;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(HashesModelAdapter());
  Hive.registerAdapter(SettingsConfigAdapter());
  Hive.registerAdapter(AlgorithmAdapter());
  Directory defaultDirectory = await getApplicationDocumentsDirectory();
  Hive.init(defaultDirectory.path + '/storages');

  await di_setup.setup();

  runApp(ThreeDApp());
}

class ThreeDApp extends StatelessWidget {
  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: '3DPass',
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
