import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/graphql/init_graphql_client.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/hashes_list/data/repositories/hash_list_store.dart';
import 'package:threedpass/features/hashes_list/domain/repositories/hashes_repository.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/data/repositories/transfers_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/usecases/get_transfers.dart';

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

  // Logger
  getIt.registerSingleton<Logger>(Logger());

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

  // await Hive.initFlutter();
  final box = await Hive.openBox<Map<String, dynamic>>("graphql_cache_ferry");
  await box.clear();
  final ferryClient = FerryClient(box).client;
  getIt.registerSingleton<Client>(ferryClient);

  // BLoCs
  getIt.registerFactory<HashesListBloc>(
    () => HashesListBloc(
      hashesRepository: getIt<HashesRepository>(),
    )..init(),
  );

  final settingsConfig = await getIt<SettingsRepository>().getConfig();
  getIt.registerSingleton<SettingsConfigCubit>(
    SettingsConfigCubit(
      config: settingsConfig,
      settingsRepository: getIt<SettingsRepository>(),
    ),
  );

  getIt.registerSingleton<AppServiceLoaderCubit>(
    AppServiceLoaderCubit(
      settingsConfigCubit: getIt<SettingsConfigCubit>(),
    ),
  );

  getIt.registerSingleton<TransfersRepository>(
    TransfersRepository(
      client: getIt<Client>(),
      appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
    ),
  );

  getIt.registerLazySingleton<GetTransfers>(
    () => GetTransfers(
      repository: getIt<TransfersRepository>(),
    ),
  );
}
