import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/polkawallet/utils/rational_remove_decimals.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_max_percent.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';

part 'remove_liquidity_cubit.g.dart';

@CopyWith()
class RemoveLiquidityState {
  final int percentage;
  final bool isLoading;
  final RemoveLiquidityInfo? removeLiquidityInfo;
  final int? maxPercent;

  RemoveLiquidityState({
    required this.percentage,
    required this.isLoading,
    required this.removeLiquidityInfo,
    required this.maxPercent,
  });

  RemoveLiquidityState.initial()
      : percentage = 50,
        isLoading = false,
        maxPercent = null,
        removeLiquidityInfo = null;
}

class RemoveLiquidityCubit extends Cubit<RemoveLiquidityState>
    with ExtrinsicShowLoadingMixin {
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
    setPercentage(state.percentage);
    calcMaxPercent();
  }

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final RemoveLiquidity removeLiquidityUseCase;
  final PoolFullInfo poolFullInfo;
  final int nativeTokenDecimals;
  final CalcRemoveLiquidityInfo calcRemoveLiquidityInfo;
  final CalcRemoveLiquidityMaxPercent calcRemoveLiquidityMaxPercent;

  // final lpTokenBurn = TextEditingController();
  // final amount1MinRecieve = TextEditingController();
  // final amount2MinRecieve = TextEditingController();
  final slippageTolerance =
      TextEditingController(text: defaultSlippage.toString());

  static const defaultSlippage = 15;

  void setPercentage(final int percentage) {
    emit(
      state.copyWith(percentage: percentage, isLoading: true),
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
    unawaited(
      calcRemoveLiquidityMaxPercent
          .call(
            CalcRemoveLiquidityMaxPercentParams(
              nativeTokenDecimals: nativeTokenDecimals,
              poolFullInfo: poolFullInfo,
            ),
          )
          .then(
            (final value) => value.when(
              left: (final _) => null,
              right: (final double maxPercent) => emit(
                state.copyWith(
                  maxPercent: maxPercent.round(),
                ),
              ),
            ),
          ),
    );
  }

  Future<void> calculate() async {
    final slippage = int.tryParse(slippageTolerance.text);
    if (slippage != null) {
      final data = await calcRemoveLiquidityInfo.call(
        CalcRemoveLiquidityInfoParams(
          nativeTokenDecimals: nativeTokenDecimals,
          percentage: state.percentage,
          poolFullInfo: poolFullInfo,
          slippage: slippage,
        ),
      );
      final newInfo = data.when(
        left: (final Failure value) => null,
        right: (final RemoveLiquidityInfo value) => value,
        //  {
        //   print(
        //     'amount1MinRecieve ${value.amount1MinRecieve.toDouble()} amount2MinRecieve ${value.amount2MinRecieve.toDouble()} amount1Expected ${value.amount1Expected.toDouble()} amount2Expected ${value.amount2Expected.toDouble()}',
        //   );
        // },
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
  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    if (state.removeLiquidityInfo == null) {
      return const Either.left(BadDataFailure('Params were not calculated'));
    }

    final lpTokenBurn = Decimal.fromBigInt(poolFullInfo.lpBalance!) *
        Decimal.fromInt(state.percentage) /
        Decimal.fromInt(100);

    final asset1Decimals =
        poolFullInfo.asset1Meta?.idecimals ?? nativeTokenDecimals;

    final asset2Decimals =
        poolFullInfo.asset2Meta?.idecimals ?? nativeTokenDecimals;

    final params = RemoveLiquidityParams(
      asset1: poolFullInfo.basicInfo.firstAsset,
      asset2: poolFullInfo.basicInfo.secondAsset,
      lpTokenBurn: lpTokenBurn.toBigInt(),
      amount1Min: state.removeLiquidityInfo!.amount1MinRecieve
          .removeDecimals(asset1Decimals),
      amount2Min: state.removeLiquidityInfo!.amount2MinRecieve
          .removeDecimals(asset2Decimals),
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
    );
    final res = removeLiquidityUseCase.call(params);
    return res;
  }
}
