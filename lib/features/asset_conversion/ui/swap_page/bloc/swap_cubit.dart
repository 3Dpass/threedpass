import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_info.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_swap_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/swap_assets.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_page/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

part 'swap_cubit.freezed.dart';

@Freezed(
  equal: false,
  copyWith: true,
  toJson: false,
  fromJson: false,
  toStringOverride: false,
)
class SwapState with _$SwapState {
  const factory SwapState({
    required final PoolAssetField firstAsset,
    required final PoolAssetField secondAsset,
    required final SwapMethod chosenMethod,
    required final bool keepAlive,
    required final SwapInfo? swapInfo,
  }) = _SwapState;
}

class SwapCubit extends Cubit<SwapState> with ExtrinsicShowLoadingMixin {
  SwapCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolAssets,
    required this.outerRouter,
    required this.swapAssets,
    required this.poscanAssetsCubit,
    required this.poolsCubit,
    required this.calcSwapInfo,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        nativeTokenDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(
          SwapState(
            firstAsset: poolAssets.first,
            secondAsset: poolAssets[1],
            chosenMethod: SwapMethod.swapExactTokensForTokens,
            keepAlive: initialKeepAlive,
            swapInfo: null,
          ),
        ) {
    firstAssetAmountController.addListener(() {
      if (state.chosenMethod == SwapMethod.swapExactTokensForTokens) {
        setSlippageTolerance();
      }
    });

    secondAssetAmountController.addListener(() {
      if (state.chosenMethod == SwapMethod.swapTokensForExactTokens) {
        setSlippageTolerance();
      }
    });
  }

  static const bool initialKeepAlive = true;

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final int nativeTokenDecimals;
  final List<PoolAssetField> poolAssets;
  final SwapAssets swapAssets;
  final PoscanAssetsCubit poscanAssetsCubit;
  final PoolsCubit poolsCubit; // TODO Refactor to use getPoolsUseCase
  final CalcSwapInfo calcSwapInfo;

  final firstAssetAmountController = TextEditingController(text: '0');
  final secondAssetAmountController = TextEditingController(text: '0');
  final slippageToleranceController =
      TextEditingController(text: defaultSlippage.toString());

  static const defaultSlippage = 15;

  void setChosenMethod(final SwapMethod chosenMethod) {
    emit(
      state.copyWith(chosenMethod: chosenMethod),
    );
  }

  void setFirstAsset(final PoolAssetField asset) {
    emit(state.copyWith(firstAsset: asset));
    calculate();
  }

  void setSecondAsset(final PoolAssetField asset) {
    emit(state.copyWith(secondAsset: asset));
    calculate();
  }

  void setKeepAlive(final bool keepAlive) {
    emit(state.copyWith(keepAlive: keepAlive));
  }

  void setSlippageTolerance() {
    emit(
      state.copyWith(swapInfo: null),
    );

    calculate();
  }

  Future<void> calculate() async {
    final isAsset1Decimal =
        Decimal.tryParse(firstAssetAmountController.text.replaceAll(',', ''));
    final isAsset2Decimal =
        Decimal.tryParse(secondAssetAmountController.text.replaceAll(',', ''));
    final correctInput = isAsset1Decimal != null && isAsset2Decimal != null;
    final isDifferentAssets = state.firstAsset != state.secondAsset;
    if (!(correctInput && isDifferentAssets)) {
      logger.v('Swap. Nothing to calculate');
      return;
    }
    //  final items = BlocProvider.of<PoscanAssetsCubit>(context).poolAssets;
    // final metadata = poscanAssetsCubit.state.metadata;
    final res = await calcSwapInfo.call(
      CalcSwapInfoParams(
        firstAsset: state.firstAsset,
        secondAsset: state.secondAsset,
        metadata: poscanAssetsCubit.state.metadata,
        nativeTokenDecimals: nativeTokenDecimals,
        firstAssetAmountControllerText:
            firstAssetAmountController.text.replaceAll(',', ''),
        secondAssetAmountControllerText:
            secondAssetAmountController.text.replaceAll(',', ''),
        swapMethod: state.chosenMethod,
        slippage: int.parse(slippageToleranceController.text),
      ),
    );

    res.when(
      left: (final e) {
        // Fluttertoast.showToast(msg: 'Error: $e');
        logger.e(e.cause);
      },
      right: (final data) {
        if (state.chosenMethod == SwapMethod.swapExactTokensForTokens) {
          secondAssetAmountController.text = data.$2.toString();
        } else {
          firstAssetAmountController.text = data.$1.toString();
        }
      },
    );
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(
    final BuildContext context,
  ) async {
    final slippageTolerance = int.tryParse(slippageToleranceController.text);
    if (slippageTolerance == null) {
      return const Either.left(BadDataFailure('Invalid slippageTolerance'));
    }

    if (state.firstAsset == state.secondAsset) {
      return const Either.left(BadDataFailure('Cannot swap same asset'));
    }

    final data = (await calcSwapInfo.call(
      CalcSwapInfoParams(
        firstAsset: state.firstAsset,
        secondAsset: state.secondAsset,
        metadata: poscanAssetsCubit.state.metadata,
        nativeTokenDecimals: nativeTokenDecimals,
        firstAssetAmountControllerText: firstAssetAmountController.text,
        secondAssetAmountControllerText: secondAssetAmountController.text,
        swapMethod: state.chosenMethod,
        slippage: int.parse(slippageToleranceController.text),
      ),
    ))
        .value;

    if (!(data is (Decimal, Decimal))) {
      return Either.left(BadDataFailure(data.toString()));
    }

    final params = SwapAssetsParams(
      asset1: state.firstAsset,
      asset2: state.secondAsset,
      // lpTokenBurn: lpTokenBurn.toBigInt(),
      amount1: data.$1.toBigInt(),
      amount2: data.$2.toBigInt(),
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
      keepAlive: state.keepAlive,
      swapMethod: state.chosenMethod,
    );
    final res = swapAssets.call(params);
    return res;
  }
}
