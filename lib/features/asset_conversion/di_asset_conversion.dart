import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_all_pools.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';

class DIAssetConversion extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<AssetConversionRepository>(
      () => AssetConversionRepositoryImpl(
        polkawalletSdk: getIt<AppServiceLoaderCubit>().state.plugin.sdk,
      ),
    );

    getIt.registerLazySingleton<GetAllPools>(
      () => GetAllPools(
        assetConversionRepository: getIt<AssetConversionRepository>(),
      ),
    );

    getIt.registerLazySingleton<PoolsCubit>(
      () => PoolsCubit(
        getAllPools: getIt<GetAllPools>(),
      ),
    );
  }
}
