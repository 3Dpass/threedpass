import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:rational/rational.dart';
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

class AddLiquidityState {
  final Rational? asset1Min;
  final Rational? asset2Min;

  const AddLiquidityState({
    this.asset1Min,
    this.asset2Min,
  });
}

class _AddLiquidityInfo {
  final Decimal asset1Desired;
  final Decimal asset2Desired;
  final Rational asset1Min;
  final Rational asset2Min;

  const _AddLiquidityInfo({
    required this.asset1Desired,
    required this.asset2Desired,
    required this.asset1Min,
    required this.asset2Min,
  });
}

class AddLiquidityCubit extends Cubit<AddLiquidityState>
    with ExtrinsicShowLoadingMixin {
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
        super(const AddLiquidityState());

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final AddLiquidity addLiquidityUseCase;
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final PoscanAssetsCubit poscanAssetsCubit;
  final int nativeDecimals;

  final amount1DesiredController = TextEditingController();
  final amount2DesiredController = TextEditingController();
  final slippageController = TextEditingController(
    text: defaultSlippage.toString(),
  );

  static const int defaultSlippage = 15;
  // final amount1Min = TextEditingController();
  // final amount2Min = TextEditingController();

  Either<Object, _AddLiquidityInfo> calcInfo() {
    final slippage = int.tryParse(slippageController.text);
    if (slippage == null) {
      return const Either.left('Slippage is not integer');
    }

    if (Decimal.tryParse(amount1DesiredController.text) == null) {
      return const Either.left('Amount 1 is not integer');
    }

    if (Decimal.tryParse(amount2DesiredController.text) == null) {
      return const Either.left('Amount 2 is not integer');
    }

    final slippageRate = Rational.fromInt(100 - slippage, 100);

    final asset1Decimals = asset1.isNative
        ? nativeDecimals
        : poscanAssetsCubit.state.metadata[asset1.assetId]!.idecimals;

    final asset2Decimals = asset2.isNative
        ? nativeDecimals
        : poscanAssetsCubit.state.metadata[asset2.assetId]!.idecimals;

    final amount1Desired = Decimal.parse(amount1DesiredController.text)
        .setDecimalsForUserInput(asset1Decimals);
    final amount1MinAmount = amount1Desired.toRational() * slippageRate;

    final amount2Desired = Decimal.parse(amount2DesiredController.text)
        .setDecimalsForUserInput(asset2Decimals);
    final amoun2MinAmount = amount2Desired.toRational() * slippageRate;

    return Either.right(
      _AddLiquidityInfo(
        asset1Desired: amount1Desired,
        asset2Desired: amount2Desired,
        asset1Min: amount1MinAmount,
        asset2Min: amoun2MinAmount,
      ),
    );
  }

  Future<void> setSlippageTolerance() async {
    emit(
      const AddLiquidityState(),
    );

    final slippage = int.tryParse(slippageController.text);
    if (slippage == null) {
      return;
    }

    final slippageRate = Rational.fromInt(100 - slippage, 100);

    Rational? amount1MinAmount;
    final amount1Desired = Decimal.tryParse(amount1DesiredController.text);
    if (amount1Desired != null) {
      amount1MinAmount = amount1Desired.toRational() * slippageRate;
    }

    Rational? amount2MinAmount;
    final amount2Desired = Decimal.tryParse(amount2DesiredController.text);
    if (amount2Desired != null) {
      amount2MinAmount = amount2Desired.toRational() * slippageRate;
    }

    emit(
      AddLiquidityState(
        asset1Min: amount1MinAmount,
        asset2Min: amount2MinAmount,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    final info = calcInfo();

    if (info.value is _AddLiquidityInfo) {
      final infoT = info.value! as _AddLiquidityInfo;

      final params = AddLiquidityParams(
        asset1: asset1,
        asset2: asset2,
        amount1Desired: infoT.asset1Desired,
        amount2Desired: infoT.asset2Desired,
        amount1Min: infoT.asset1Min.toBigInt().toDecimal(),
        amount2Min: infoT.asset2Min.toBigInt().toDecimal(),
        account: account,
        password: passwordController.text,
        updateStatus: () => updateStatus(context),
      );
      final res = addLiquidityUseCase.call(params);
      return res;
    } else {
      return Either.left(BadDataFailure(info.value.toString()));
    }
  }
}
