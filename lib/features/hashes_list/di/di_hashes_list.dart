import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/core/utils/di_module.dart';

import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/data/repositories/hash_list_store.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';

class DIHashesList extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    final Directory supportDir = await getApplicationDocumentsDirectory();
    getIt.registerSingleton<ObjectsDirectory>(
      ObjectsDirectory(supportDir.path),
    );

    // Storages
    getIt.registerSingleton<HiveHashStore>(
      HiveHashStore(),
    );
    getIt.registerSingleton<HiveSettingsStore>(
      HiveSettingsStore(),
    );

    // open boxes
    await getIt<HiveHashStore>().init();
    await getIt<HiveSettingsStore>().init();

    getIt.registerSingleton<HashesRepository>(
      HashesRepositoryImpl(
        hiveHashStore: getIt<HiveHashStore>(),
      ),
    );

    getIt.registerLazySingleton<HashesListBloc>(
      () => HashesListBloc(
        hashesRepository: getIt<HashesRepository>(),
        objectsDirectory: getIt<ObjectsDirectory>(),
      )..init(),
    );
  }
}
