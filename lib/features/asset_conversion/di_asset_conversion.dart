import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_max_percent.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_swap_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/get_all_pools.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/swap_assets.dart';
import 'package:threedpass/features/asset_conversion/ui/add_liquidity/bloc/add_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/create_pool/bloc/create_pool_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/remove_liquidity/bloc/remove_liquidity_cubit.dart';
import 'package:threedpass/features/asset_conversion/ui/swap/bloc/swap_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/wallet_screen/notifications_page/bloc/notifications_bloc.dart';

class DIAssetConversion extends DIModule {
  @override
  Future<void> setup(final GetIt getIt) async {
    getIt.registerLazySingleton<AssetConversionRepository>(
      () => AssetConversionRepositoryImpl(
        polkawalletSdk: getIt<AppServiceLoaderCubit>().state.plugin.sdk,
        callSignExtrinsicUtil: getIt<CallSignExtrinsicUtil>(),
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
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        poolsCubit: getIt<PoolsCubit>(),
        webViewRunner: getIt<AppServiceLoaderCubit>()
            .state
            .plugin
            .sdk
            .api
            .service
            .webView!,
      ),
    );
    getIt.registerFactoryParam<CreatePoolCubit, StackRouter, void>(
      (final StackRouter param1, final _) => CreatePoolCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        createPoolUseCase: getIt<CreatePool>(),
        outerRouter: param1,
      ),
    );

    getIt.registerFactory<AddLiquidity>(
      () => AddLiquidity(
        assetConversionRepository: getIt<AssetConversionRepository>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        poolsCubit: getIt<PoolsCubit>(),
        webViewRunner: getIt<AppServiceLoaderCubit>()
            .state
            .plugin
            .sdk
            .api
            .service
            .webView!,
      ),
    );

    getIt.registerFactoryParam<AddLiquidityCubit, StackRouter, PoolFullInfo>(
      (final StackRouter param1, final PoolFullInfo param2) =>
          AddLiquidityCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        addLiquidityUseCase: getIt<AddLiquidity>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
        outerRouter: param1,
        poolFullInfo: param2,
      ),
    );

    getIt.registerFactory<RemoveLiquidity>(
      () => RemoveLiquidity(
        assetConversionRepository: getIt<AssetConversionRepository>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        poolsCubit: getIt<PoolsCubit>(),
        webViewRunner: getIt<AppServiceLoaderCubit>()
            .state
            .plugin
            .sdk
            .api
            .service
            .webView!,
      ),
    );

    getIt.registerFactory<CalcRemoveLiquidityInfo>(
      () => const CalcRemoveLiquidityInfo(),
    );

    getIt.registerFactory<CalcRemoveLiquidityMaxPercent>(
      () => CalcRemoveLiquidityMaxPercent(
        assetConversionRepository: getIt<AssetConversionRepository>(),
      ),
    );

    getIt.registerFactoryParam<RemoveLiquidityCubit, StackRouter, PoolFullInfo>(
      (final StackRouter param1, final PoolFullInfo param2) =>
          RemoveLiquidityCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        removeLiquidityUseCase: getIt<RemoveLiquidity>(),
        calcRemoveLiquidityInfo: getIt<CalcRemoveLiquidityInfo>(),
        calcRemoveLiquidityMaxPercent: getIt<CalcRemoveLiquidityMaxPercent>(),
        outerRouter: param1,
        poolFullInfo: param2,
      ),
    );

    getIt.registerFactory<SwapAssets>(
      () => SwapAssets(
        assetConversionRepository: getIt<AssetConversionRepository>(),
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        notificationsBloc: getIt<NotificationsBloc>(),
        poolsCubit: getIt<PoolsCubit>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
        webViewRunner: getIt<AppServiceLoaderCubit>()
            .state
            .plugin
            .sdk
            .api
            .service
            .webView!,
      ),
    );

    getIt.registerFactory<CalcSwapOnFirstChanged>(
      () => CalcSwapOnFirstChanged(
        assetConversionRepository: getIt<AssetConversionRepository>(),
      ),
    );
    getIt.registerFactory<CalcSwapOnSecondChanged>(
      () => CalcSwapOnSecondChanged(
        assetConversionRepository: getIt<AssetConversionRepository>(),
      ),
    );

    getIt.registerFactoryParam<SwapCubit, StackRouter, List<PoolAssetField>>(
      (final StackRouter param1, final List<PoolAssetField> param2) =>
          SwapCubit(
        appServiceLoaderCubit: getIt<AppServiceLoaderCubit>(),
        outerRouter: param1,
        poolAssets: param2,
        swapAssets: getIt<SwapAssets>(),
        poscanAssetsCubit: getIt<PoscanAssetsCubit>(),
        poolsCubit: getIt<PoolsCubit>(),
        calcSwapOnFirstChanged: getIt<CalcSwapOnFirstChanged>(),
        calcSwapOnSecondChanged: getIt<CalcSwapOnSecondChanged>(),
      ),
    );
  }
}
