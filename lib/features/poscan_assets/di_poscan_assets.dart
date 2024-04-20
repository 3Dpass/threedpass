import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/mint_asset.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/set_metadata.dart';
import 'package:threedpass/features/poscan_assets/ui/create_assset/bloc/create_poscan_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/mint_asset/bloc/mint_asset_cubit.dart';
import 'package:threedpass/features/poscan_assets/ui/set_metadata/bloc/set_metadata_asset_cubit.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DIPoscanAssets extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<PoscanAssetsRepository>(
      () => PoscanAssetsRepositoryImpl(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
      ),
    );

    // Create asset
    getIt.registerLazySingleton<CreateAsset>(
      () => CreateAsset(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        repository: getIt<PoscanAssetsRepository>(),
      ),
    );
    getIt.registerFactoryParam<CreatePoscanAssetCubit, StackRouter, void>(
      (final router, final _) => CreatePoscanAssetCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        createAssetUseCase: getIt<CreateAsset>(),
        outerRouter: router,
      ),
    );

    // Set metadata
    getIt.registerLazySingleton<SetMetadata>(
      () => SetMetadata(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        repository: getIt<PoscanAssetsRepository>(),
      ),
    );
    getIt.registerFactoryParam<SetMetadataAssetCubit, int, void>(
      (final p0, final _) => SetMetadataAssetCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        setMetadata: getIt<SetMetadata>(),
        initialAssetId: p0,
      ),
    );

    // Mint
    getIt.registerLazySingleton<MintAsset>(
      () => MintAsset(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        repository: getIt<PoscanAssetsRepository>(),
      ),
    );
    getIt.registerFactoryParam<MintAssetCubit, int, void>(
      (final initialAssetId, final _) => MintAssetCubit(
        initialAsset: initialAssetId,
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        mintAsset: getIt<MintAsset>(),
      ),
    );

    getIt.registerLazySingleton<PoscanAssetsCubit>(
      () => PoscanAssetsCubit(
        repository: getIt<PoscanAssetsRepository>(),
      ),
    );
  }
}
