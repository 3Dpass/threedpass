import 'package:app_install_date/app_install_date.dart';
import 'package:ferry/ferry.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/utils/m_app_install_date.dart';
import 'package:threedpass/features/accounts/di_accounts.dart';
import 'package:threedpass/features/asset_conversion/di_asset_conversion.dart';
import 'package:threedpass/features/atomic_swap/di_atomic_swap.dart';
import 'package:threedpass/features/connection/di_connection.dart';
import 'package:threedpass/features/connection/polkadot/bloc/polkadot_node_url.dart';
import 'package:threedpass/features/graphql/graphql_di.dart';
import 'package:threedpass/features/graphql/transfers_history/data/repositories/transfers_repo_remote.dart';
import 'package:threedpass/features/hashes_list/di/di_hashes_list.dart';
import 'package:threedpass/features/poscan/di_poscan.dart';
import 'package:threedpass/features/poscan_assets/di_poscan_assets.dart';
import 'package:threedpass/features/poscan_objects_query/di_polkadot_query.dart';
import 'package:threedpass/features/poscan_putobject/di_preview_page.dart';
import 'package:threedpass/features/scan_page/di_scan_page.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/di/di_contacts.dart';
import 'package:threedpass/features/wallet_screen/di_wallet_page.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/di/di_non_native_token.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/data/repositories/transfers_repository.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/usecases/get_transfers.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/di_transfer_page.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  getIt.registerSingleton<PackageInfo>(packageInfo);

  try {
    final DateTime date = await AppInstallDate().installDate;
    getIt.registerSingleton<DateTime>(
      date,
      instanceName: MAppInstallDate.instanceName,
    );
  } on Object catch (_) {
    logger.d('Impossible to get app install date');
  }

  await DIHashesList().setup(getIt);

  // Repos
  getIt.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(
      hiveSettingsStore: getIt<HiveSettingsStore>(),
    ),
  );

  await ThreedpGraphql().setup(getIt);

  // BLoCs
  final settingsConfig = await getIt<SettingsRepository>().getConfig();
  getIt.registerSingleton<SettingsCubit>(
    SettingsCubit(
      config: settingsConfig,
      settingsRepository: getIt<SettingsRepository>(),
    ),
  );

  await DIConnection().setup(getIt);

  getIt.registerSingleton<AppServiceLoaderCubit>(
    AppServiceLoaderCubit(
      settingsConfigCubit: getIt<SettingsCubit>(),
      polkadotNodeUrl: getIt<PolkadotNodeUrl>(),
    ),
  );

  getIt.registerLazySingleton<TransfersRepository>(
    () => TransfersRepository(
      client: getIt<Client>(),
      appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      transfersDatasourceGQL: getIt<TransfersDatasource>(),
    ),
  );

  getIt.registerLazySingleton<GetTransfers>(
    () => GetTransfers(
      repository: getIt<TransfersRepository>(),
    ),
  );

  getIt.registerLazySingleton<CallSignExtrinsicUtil>(
    () => CallSignExtrinsicUtil(
      appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
    ),
  );

  await DIScanPage().setup(getIt);

  await DIAccounts().setup(getIt);

  await DINonNativeToken().setup(getIt);

  await DIWalletPage().setup(getIt);

  await DIPreviewPage().setup(getIt);

  await DIContacts().setup(getIt);

  await DIPoscanQuery().setup(getIt);

  await DITransferPage().setup(getIt);

  await DIPoscanAssets().setup(getIt);

  await DIAssetConversion().setup(getIt);

  await DIPoscan().setup(getIt);

  await DiAtomicSwap().setup(getIt);
}
