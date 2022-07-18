import 'package:get_it/get_it.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_live_net_plugin.dart';
import 'package:threedpass/features/hashes_list/data/repositories/hash_list_store.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

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

  // Plugins
  getIt.registerSingleton<Keyring>(Keyring());
  getIt.registerSingleton<D3pLiveNetPlugin>(D3pLiveNetPlugin());

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

  getIt.registerFactory<AppServiceLoaderCubit>(
    () => AppServiceLoaderCubit(
      polkawalletPlugin: getIt<D3pLiveNetPlugin>(),
      keyring: getIt<Keyring>(),
    ),
  );
}
