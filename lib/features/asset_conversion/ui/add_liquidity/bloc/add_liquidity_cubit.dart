import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/decimal_set_decimals.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class AddLiquidityCubit extends Cubit<void> with ExtrinsicShowLoadingMixin {
  AddLiquidityCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required final PoolFullInfo poolFullInfo,
    required this.addLiquidityUseCase,
    required this.poscanAssetsCubit,
    required this.outerRouter,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        asset1 = poolFullInfo.basicInfo.firstAsset,
        asset2 = poolFullInfo.basicInfo.secondAsset,
        nativeDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(null);

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final AddLiquidity addLiquidityUseCase;
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final PoscanAssetsCubit poscanAssetsCubit;
  final int nativeDecimals;

  final passwordController = TextEditingController();
  final amount1Desired = TextEditingController();
  final amount2Desired = TextEditingController();
  final amount1Min = TextEditingController();
  final amount2Min = TextEditingController();

  @override
  Future<Either<Failure, void>> callExtrinsic(final BuildContext context) {
    final asset1Decimals = asset1.isNative
        ? nativeDecimals
        : poscanAssetsCubit.state.metadata[asset1.assetId]!.idecimals;

    final asset2Decimals = asset2.isNative
        ? nativeDecimals
        : poscanAssetsCubit.state.metadata[asset2.assetId]!.idecimals;
    final params = AddLiquidityParams(
      asset1: asset1,
      asset2: asset2,
      amount1Desired:
          Decimal.parse(amount1Desired.text).setDecimals(asset1Decimals),
      amount2Desired:
          Decimal.parse(amount2Desired.text).setDecimals(asset2Decimals),
      amount1Min: Decimal.parse(amount1Min.text).setDecimals(asset1Decimals),
      amount2Min: Decimal.parse(amount2Min.text).setDecimals(asset2Decimals),
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
    );
    final res = addLiquidityUseCase.call(params);
    return res;
  }
}
