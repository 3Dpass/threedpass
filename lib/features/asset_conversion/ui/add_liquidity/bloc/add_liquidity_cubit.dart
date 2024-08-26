import 'dart:async';

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
import 'package:threedpass/core/polkawallet/utils/rational_remove_decimals.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class AddLiquidityState {
  final String? asset1Min;
  final String? asset2Min;

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
  final String? error;

  const _AddLiquidityInfo({
    required this.asset1Desired,
    required this.asset2Desired,
    required this.asset1Min,
    required this.asset2Min,
    required this.error,
  });
}

class AddLiquidityCubit extends Cubit<AddLiquidityState>
    with ExtrinsicShowLoadingMixin {
  AddLiquidityCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolFullInfo,
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
  final PoolFullInfo poolFullInfo;

  final amount1DesiredController = TextEditingController();
  final amount2DesiredController = TextEditingController();
  final slippageController = TextEditingController(
    text: defaultSlippage.toString(),
  );

  static const int defaultSlippage = 15;
  // final amount1Min = TextEditingController();
  // final amount2Min = TextEditingController();

  bool get areNullReserves => poolFullInfo.rawPoolReserve == null;

  Rational get slippageRate {
    final slippage = int.parse(slippageController.text);
    return Rational.fromInt(100 - slippage, 100);
  }

  int get asset1Decimals => asset1.isNative
      ? nativeDecimals
      : poscanAssetsCubit.state.metadata[asset1.assetId]!.idecimals;

  Decimal? get amount1Desired => Decimal.tryParse(amount1DesiredController.text)
      ?.setDecimalsForUserInput(asset1Decimals);

  int get asset2Decimals => asset2.isNative
      ? nativeDecimals
      : poscanAssetsCubit.state.metadata[asset2.assetId]!.idecimals;

  Decimal? get amount2Desired => Decimal.tryParse(amount2DesiredController.text)
      ?.setDecimalsForUserInput(asset2Decimals);

  Rational get amount2Optimal => quote(
        amount1Desired!,
        poolFullInfo.rawPoolReserve!.balance1Decimal,
        poolFullInfo.rawPoolReserve!.balance2Decimal,
      );

  Rational get amount1Optimal => quote(
        amount2Desired!,
        poolFullInfo.rawPoolReserve!.balance2Decimal,
        poolFullInfo.rawPoolReserve!.balance1Decimal,
      );

  Rational? get amount1MinAmount => amount1Desired != null
      ? amount1Desired!.toRational() * slippageRate
      : null;
  Rational? get amount2MinAmount => amount2Desired != null
      ? amount2Desired!.toRational() * slippageRate
      : null;

  Either<Object, _AddLiquidityInfo> calcInfoForNotNullPool() {
    try {
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

      logger.t(
        'amount1optimal ${amount1Optimal.toDouble()} 1min: ${amount1MinAmount!.toDouble()} amount2optimal ${amount2Optimal.toDouble()} 2min:${amount2MinAmount!.toDouble()}',
      );

      String? error;

      final asset1Symbols = asset1.isNative
          ? 'P3D'
          : poscanAssetsCubit.state.metadata[asset1.assetId]!.symbol;
      final asset2Symbols = asset2.isNative
          ? 'P3D'
          : poscanAssetsCubit.state.metadata[asset2.assetId]!.symbol;

      if (amount2Optimal < amount2MinAmount!) {
        error = 'ERROR: Asset $asset2Symbols deposit did not meet minimum';
      }

      if (amount1Optimal < amount1MinAmount!) {
        error = 'ERROR: Asset $asset1Symbols deposit did not meet minimum';
      }

      return Either.right(
        _AddLiquidityInfo(
          asset1Desired: amount1Desired!,
          asset2Desired: amount2Desired!,
          asset1Min: amount1MinAmount!,
          asset2Min: amount2MinAmount!,
          error: error,
        ),
      );
    } on Object catch (e) {
      logger.e(e);
      return Either.left(e);
    }
  }

  void onFirstDesiredChanged() {
    try {
      if (!areNullReserves) {
        amount2DesiredController.text =
            amount2Optimal.setDecimalsNToFixedString(asset2Decimals);
      }
      setSlippageTolerance();
    } on Object catch (e) {
      logger.t(e);
    }
  }

  void onSecondDesiredChanged() {
    try {
      if (!areNullReserves) {
        amount1DesiredController.text =
            amount1Optimal.setDecimalsNToFixedString(asset1Decimals);
      }
      setSlippageTolerance();
    } on Object catch (e) {
      logger.t(e);
    }
  }

  Rational quote(
    final Decimal amount,
    final Decimal reserve1,
    final Decimal reserve2,
  ) {
    return amount * reserve2 / reserve1;
  }

  Future<void> setSlippageTolerance() async {
    emit(
      const AddLiquidityState(),
    );

    final slippage = int.tryParse(slippageController.text);
    if (slippage == null) {
      return;
    }

    emit(
      AddLiquidityState(
        asset1Min: amount1MinAmount?.setDecimalsNToFixedString(asset1Decimals),
        asset2Min: amount2MinAmount?.setDecimalsNToFixedString(asset2Decimals),
      ),
    );
  }

  Either<Failure, _AddLiquidityInfo> calcInfoForNullPool() {
    try {
      return Either.right(
        _AddLiquidityInfo(
          asset1Desired: amount1Desired!,
          asset2Desired: amount2Desired!,
          asset1Min: amount1MinAmount!,
          asset2Min: amount2MinAmount!,
          error: null,
        ),
      );
    } on Object catch (e) {
      logger.e(e);
      return Either.left(BadDataFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    final info =
        areNullReserves ? calcInfoForNullPool() : calcInfoForNotNullPool();

    if (info.value is _AddLiquidityInfo) {
      final infoT = info.value! as _AddLiquidityInfo;

      if (infoT.error != null) {
        return Either.left(BadDataFailure(infoT.error!));
      }

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
