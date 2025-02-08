import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/rational_remove_decimals.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_max_percent.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';

part 'remove_liquidity_cubit.g.dart';

@CopyWith()
class RemoveLiquidityState {
  final int percentage;
  @Deprecated('Use AsyncValue')
  final bool isLoading;
  final RemoveLiquidityInfo? removeLiquidityInfo;
  final int? maxPercent;
  final bool isMaxChosen;

  RemoveLiquidityState({
    required this.percentage,
    required this.isLoading,
    required this.removeLiquidityInfo,
    required this.maxPercent,
    required this.isMaxChosen,
  });

  RemoveLiquidityState.initial()
      : percentage = 50,
        isLoading = false,
        isMaxChosen = false,
        maxPercent = null,
        removeLiquidityInfo = null;
}

class RemoveLiquidityCubit extends Cubit<RemoveLiquidityState>
    with ExtrinsicShowLoadingMixin<void, RemoveLiquidityParams> {
  RemoveLiquidityCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolFullInfo,
    required this.removeLiquidityUseCase,
    required this.outerRouter,
    required this.calcRemoveLiquidityInfo,
    required this.calcRemoveLiquidityMaxPercent,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        nativeTokenDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(RemoveLiquidityState.initial()) {
    init();
  }

  Future<void> init() async {
    logger.t('Init RemoveLiquidityCubit');
    setPercentage(state.percentage, false);
    await calcMaxPercent();
    logger.t(
      'Init RemoveLiquidityCubit 2. maxPercent: ${state.maxPercent}, current: ${state.percentage}',
    );
    if (state.maxPercent != null && state.percentage > state.maxPercent!) {
      logger.d(
        'Adjustment current percentage after max is calculated. max: ${state.maxPercent}',
      );
      emit(state.copyWith(percentage: state.maxPercent));
    }
  }

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final RemoveLiquidity removeLiquidityUseCase;
  final PoolFullInfo poolFullInfo;
  final int nativeTokenDecimals;
  final CalcRemoveLiquidityInfo calcRemoveLiquidityInfo;
  final CalcRemoveLiquidityMaxPercent calcRemoveLiquidityMaxPercent;

  final slippageTolerance =
      TextEditingController(text: defaultSlippage.toString());
  final customPercentage = TextEditingController();

  static const defaultSlippage = 15;

  void setPercentage(final int percentage, final bool isMax) {
    logger.t('Set percentage $percentage, isMax: $isMax');
    customPercentage.text = '$percentage';
    emit(
      state.copyWith(
        percentage: percentage,
        isLoading: true,
        isMaxChosen: isMax,
      ),
    );

    calculate();
  }

  void setSlippageTolerance() {
    emit(
      state.copyWith(isLoading: true),
    );

    calculate();
  }

  Future<void> calcMaxPercent() async {
    final value = await calcRemoveLiquidityMaxPercent.call(
      CalcRemoveLiquidityMaxPercentParams(
        poolFullInfo: poolFullInfo,
        nativeTokenDecimals: nativeTokenDecimals,
      ),
    );

    emit(
      state.copyWith(
        maxPercent: value.round(),
      ),
    );
  }

  Future<void> calculate() async {
    final slippage = int.tryParse(slippageTolerance.text);
    if (slippage != null) {
      final newInfo = await calcRemoveLiquidityInfo.call(
        CalcRemoveLiquidityInfoParams(
          poolFullInfo: poolFullInfo,
          percentage: state.percentage,
          slippage: slippage,
          nativeTokenDecimals: nativeTokenDecimals,
        ),
      );

      emit(
        state.copyWith(isLoading: false, removeLiquidityInfo: newInfo),
      );
    } else {
      emit(
        state.copyWith(isLoading: false, removeLiquidityInfo: null),
      );
    }
  }

  @override
  RemoveLiquidityParams params(final BuildContext context) {
    if (state.removeLiquidityInfo == null) {
      throw Exception('Params were not calculated');
    }

    final lpTokenBurn = Decimal.fromBigInt(poolFullInfo.lpBalance!) *
        Decimal.fromInt(state.percentage) /
        Decimal.fromInt(100);

    final asset1Decimals =
        poolFullInfo.asset1Meta?.idecimals ?? nativeTokenDecimals;

    final asset2Decimals =
        poolFullInfo.asset2Meta?.idecimals ?? nativeTokenDecimals;

    return RemoveLiquidityParams(
      asset1: poolFullInfo.basicInfo.firstAsset,
      asset2: poolFullInfo.basicInfo.secondAsset,
      updateStatus: () => updateStatus(context),
      account: account,
      password: passwordController.text,
      lpTokenBurn: lpTokenBurn.toBigInt(),
      amount1Min: state.removeLiquidityInfo!.amount1MinRecieve
          .removeDecimals(asset1Decimals),
      amount2Min: state.removeLiquidityInfo!.amount2MinRecieve
          .removeDecimals(asset2Decimals),
    );
  }

  @override
  SafeUseCaseCall<void, RemoveLiquidityParams> get safeCall =>
      removeLiquidityUseCase.safeCall;
}
