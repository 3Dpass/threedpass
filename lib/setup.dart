import 'package:get_it/get_it.dart';
import 'package:threedpass/features/hashes_list/data/repositories/hash_list_store.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
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

  // Repos
  getIt.registerSingleton<HashesRepository>(
    HashesRepositoryImpl(
      hiveHashStore: getIt<HiveHashStore>(),
    ),
  );

  getIt.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(
      hiveSettingsStore: getIt<HiveSettingsStore>(),
    ),
  );

  // BLoCs
  getIt.registerFactory<HashesListBloc>(
    () => HashesListBloc(
      hashesRepository: getIt<HashesRepository>(),
    )..init(),
  );

  getIt.registerFactory<SettingsConfigCubit>(
    () => SettingsConfigCubit(
      settingsRepository: getIt<SettingsRepository>(),
    )..init(),
  );
}
