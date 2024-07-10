import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_remove_liquidity_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';

part 'remove_liquidity_cubit.g.dart';

@CopyWith()
class RemveLiquidityState {
  final int percentage;
  final bool isLoading;
  final RemoveLiquidityInfo? removeLiquidityInfo;

  RemveLiquidityState({
    required this.percentage,
    required this.isLoading,
    required this.removeLiquidityInfo,
  });

  RemveLiquidityState.initial()
      : percentage = 50,
        isLoading = false,
        removeLiquidityInfo = null;
}

class RemoveLiquidityCubit extends Cubit<RemveLiquidityState>
    with ExtrinsicShowLoadingMixin {
  RemoveLiquidityCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolFullInfo,
    required this.removeLiquidityUseCase,
    required this.outerRouter,
    required this.calcRemoveLiquidityInfo,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        defaultDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(RemveLiquidityState.initial());

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final RemoveLiquidity removeLiquidityUseCase;
  final PoolFullInfo poolFullInfo;
  final int defaultDecimals;
  final CalcRemoveLiquidityInfo calcRemoveLiquidityInfo;

  final passwordController = TextEditingController();
  final lpTokenBurn = TextEditingController();
  final amount1MinRecieve = TextEditingController();
  final amount2MinRecieve = TextEditingController();
  final slippageTolerance =
      TextEditingController(text: defaultSlippage.toString());

  static const defaultSlippage = 15;

  void setPercentage(final int percentage) {
    emit(
      state.copyWith(percentage: percentage, isLoading: true),
    );

    calculate(percentage);
  }

  Future<void> calculate(final int percentage) async {
    final data = await calcRemoveLiquidityInfo.call(
      CalcRemoveLiquidityInfoParams(
        nativeTokenDecimals: defaultDecimals,
        percentage: state.percentage,
        poolFullInfo: poolFullInfo,
        slippage: int.parse(slippageTolerance.text),
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

    // final asset1Decimals =
    //     poolFullInfo.asset1Meta?.idecimals ?? defaultDecimals;
    // final asset2Decimals =
    //     poolFullInfo.asset2Meta?.idecimals ?? defaultDecimals;

    // final expected1 =
    //     Decimal.fromBigInt(poolFullInfo.rawPoolReserve!.balance1BigInt)
    //             .setDecimalsForRaw(asset1Decimals) *
    //         Rational.fromInt(percentage, 100);
    // final expected2 =
    //     Decimal.fromBigInt(poolFullInfo.rawPoolReserve!.balance2BigInt)
    //             .setDecimalsForRaw(asset2Decimals) *
    //         Rational.fromInt(percentage, 100);

    // // final min1 = print(expected1.toDouble());

    // print(
    //     'expected1 ${expected1.toDouble()} expected2 ${expected2.toDouble()}');

    emit(
      state.copyWith(isLoading: false, removeLiquidityInfo: newInfo),
    );
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(final BuildContext context) {
    final params = RemoveLiquidityParams(
      asset1: poolFullInfo.basicInfo.firstAsset,
      asset2: poolFullInfo.basicInfo.secondAsset,
      lpTokenBurn: BigInt.parse(lpTokenBurn.text),
      amount1Min: BigInt.parse(amount1MinRecieve.text),
      amount2Min: BigInt.parse(amount2MinRecieve.text),
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
    );
    final res = removeLiquidityUseCase.call(params);
    return res;
  }
}
