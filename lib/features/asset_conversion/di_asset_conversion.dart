import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_all_pools.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';

class DIAssetConversion extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerFactory<AssetConversionRepository>(
      () => AssetConversionRepositoryImpl(
        polkawalletSdk: getIt<AppServiceLoaderCubit>().state.plugin.sdk,
      ),
    );
    getIt.registerFactory<GetAllPools>(
      () => GetAllPools(
        assetConversionRepository: getIt<AssetConversionRepository>(),
        poscanAssetsRepo: getIt<PoscanAssetsRepository>(),
      ),
    );
    getIt.registerLazySingleton<PoolsCubit>(
      () => PoolsCubit(
        getAllPools: getIt<GetAllPools>(),
      ),
    );

    getIt.registerFactory<CreatePool>(
      () => CreatePool(
        assetConversionRepository: getIt<AssetConversionRepository>(),
      ),
    );
    getIt.registerFactoryParam<CreatePoolCubit, StackRouter, void>(
      (final StackRouter param1, final _) => CreatePoolCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        createPoolUseCase: getIt<CreatePool>(),
        outerRouter: param1,
      ),
    );
  }
}
