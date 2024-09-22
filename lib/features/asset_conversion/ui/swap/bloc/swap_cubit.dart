import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/decimal_set_decimals.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/calc_swap_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/swap_assets.dart';
import 'package:threedpass/features/asset_conversion/ui/pools_list/bloc/pools_cubit.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

part 'swap_cubit.freezed.dart';

// typedef SwapState = AsyncValue<_SwapState>;

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
    required final Decimal? slippageValue,
    required final String errorUnlocalized,
    required final bool isLoading,
  }) = _SwapState;
}

class SwapCubit extends Cubit<SwapState>
    with ExtrinsicShowLoadingMixin<void, SwapAssetsParams> {
  SwapCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolAssets,
    required this.outerRouter,
    required this.swapAssets,
    required this.poscanAssetsCubit,
    required this.poolsCubit,
    required this.calcSwapOnFirstChanged,
    required this.calcSwapOnSecondChanged,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        nativeTokenDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(
          _SwapState(
            firstAsset: poolAssets.first,
            secondAsset: poolAssets[1],
            chosenMethod: SwapMethod.swapExactTokensForTokens,
            keepAlive: initialKeepAlive,
            slippageValue: null,
            errorUnlocalized: '',
            isLoading: false,
          ),
        ) {
    firstAssetAmountController.addListener(() async {
      if (state.chosenMethod == SwapMethod.swapExactTokensForTokens) {
        await onFirstDesiredChanged();
      }
    });

    secondAssetAmountController.addListener(() async {
      if (state.chosenMethod == SwapMethod.swapTokensForExactTokens) {
        await onSecondDesiredChanged();
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
  final PoolsCubit poolsCubit;
  final CalcSwapOnFirstChanged calcSwapOnFirstChanged;
  final CalcSwapOnSecondChanged calcSwapOnSecondChanged;

  final firstAssetAmountController = TextEditingController(text: '0');
  final secondAssetAmountController = TextEditingController(text: '0');
  final slippageToleranceController =
      TextEditingController(text: defaultSlippage.toString());

  static const defaultSlippage = 15;

  Map<int, PoscanAssetMetadata> get metadata =>
      poscanAssetsCubit.state.metadata;

  int get asset1Decimals => state.firstAsset.isNative
      ? nativeTokenDecimals
      : metadata[state.firstAsset.assetId]!.idecimals;

  int get asset2Decimals => state.secondAsset.isNative
      ? nativeTokenDecimals
      : metadata[state.secondAsset.assetId]!.idecimals;

  Decimal? get asset1Decimal =>
      Decimal.tryParse(firstAssetAmountController.text.replaceAll(',', ''));
  Decimal? get asset2Decimal =>
      Decimal.tryParse(secondAssetAmountController.text.replaceAll(',', ''));

  Future<void> setChosenMethod(final SwapMethod chosenMethod) async {
    emit(
      state.copyWith(chosenMethod: chosenMethod, isLoading: true),
    );
    await handleOnChange();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> setFirstAsset(final PoolAssetField asset) async {
    logger.t(
      'Swap. setFirstAsset. isSelectedEqualToSecond:${asset == state.secondAsset} first:${state.firstAsset} second:${state.secondAsset}',
    );
    emit(
      state.copyWith(
        firstAsset: asset,
        secondAsset:
            asset == state.secondAsset ? state.firstAsset : state.secondAsset,
        isLoading: true,
        errorUnlocalized: '',
        // slippageValue: null,
      ),
    );
    cutDecimals();
    await handleOnChange();
    reportIfPoolDoesNotExist();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> setSecondAsset(final PoolAssetField asset) async {
    emit(
      state.copyWith(
        firstAsset:
            asset == state.firstAsset ? state.secondAsset : state.firstAsset,
        secondAsset: asset,
        isLoading: true,
        errorUnlocalized: '',
        // slippageValue: null,
      ),
    );
    cutDecimals();
    await handleOnChange();
    reportIfPoolDoesNotExist();
    emit(state.copyWith(isLoading: false));
  }

  void reportIfPoolDoesNotExist() {
    final result = checkIfChosenPoolExists();
    if (result == null) {
      emit(state.copyWith(errorUnlocalized: 'swap_pool_could_not_check'));
      return;
    }
    if (!result) {
      emit(state.copyWith(errorUnlocalized: 'swap_pool_not_found'));
      return;
    }
  }

  bool? checkIfChosenPoolExists() => poolsCubit.state.value?.pools.any(
        (final poolInfo) =>
            (poolInfo.basicInfo.firstAsset == state.firstAsset &&
                poolInfo.basicInfo.secondAsset == state.secondAsset) ||
            (poolInfo.basicInfo.firstAsset == state.secondAsset &&
                poolInfo.basicInfo.secondAsset == state.firstAsset),
      );

  void setKeepAlive(final bool keepAlive) {
    emit(state.copyWith(keepAlive: keepAlive));
  }

  Future<void> setSlippageTolerance() async {
    emit(state.copyWith(isLoading: true));
    await handleOnChange();
    emit(state.copyWith(isLoading: false));
  }

  void cutDecimals() {
    final a1d = asset1Decimal;
    if (a1d != null && a1d.scale > asset1Decimals) {
      firstAssetAmountController.text =
          a1d.truncate(scale: asset1Decimals).toString();
    }
    final a2d = asset2Decimal;
    if (a2d != null && a2d.scale > asset2Decimals) {
      secondAssetAmountController.text =
          a2d.truncate(scale: asset2Decimals).toString();
    }
  }

  Future<void> handleOnChange() async {
    if (state.chosenMethod == SwapMethod.swapExactTokensForTokens) {
      await onFirstDesiredChanged();
    } else {
      await onSecondDesiredChanged();
    }
  }

  Future<(Decimal, Decimal)> get calcOnFirstChanged =>
      calcSwapOnFirstChanged.call(
        CalcSwapOnChangedParams(
          assetAmountControllerText:
              firstAssetAmountController.text.replaceAll(',', ''),
          firstAsset: state.firstAsset,
          secondAsset: state.secondAsset,
          metadata: metadata,
          slippage: int.parse(slippageToleranceController.text),
          nativeTokenDecimals: nativeTokenDecimals,
        ),
      );

  Future<void> onFirstDesiredChanged() async {
    if (firstAssetAmountController.text.isEmpty) {
      return;
    }
    try {
      final res = await calcOnFirstChanged;

      secondAssetAmountController.text = res.$1.toStringAsFixed(asset2Decimals);
      emit(
        state.copyWith(
          slippageValue: res.$2,
        ),
      );
    } on Object catch (e) {
      logger.t(e);
    }
  }

  Future<(Decimal, Decimal)> get calcOnSecondChanged =>
      calcSwapOnSecondChanged.call(
        CalcSwapOnChangedParams(
          assetAmountControllerText:
              secondAssetAmountController.text.replaceAll(',', ''),
          firstAsset: state.firstAsset,
          secondAsset: state.secondAsset,
          metadata: metadata,
          slippage: int.parse(slippageToleranceController.text),
          nativeTokenDecimals: nativeTokenDecimals,
        ),
      );

  Future<void> onSecondDesiredChanged() async {
    if (secondAssetAmountController.text.isEmpty) {
      return;
    }
    try {
      final res = await calcOnSecondChanged;

      firstAssetAmountController.text = res.$1.toStringAsFixed(asset1Decimals);
      emit(
        state.copyWith(
          slippageValue: res.$2,
        ),
      );
    } on Object catch (e) {
      logger.t(e);
    }
  }

  @override
  Future<SwapAssetsParams> params(final BuildContext context) async {
    final slippageTolerance = int.tryParse(slippageToleranceController.text);
    if (slippageTolerance == null) {
      throw Exception('Invalid slippageTolerance');
    }

    if (state.firstAsset == state.secondAsset) {
      throw Exception('Can not swap same asset');
    }

    final secondAmountToSendResponse =
        await (state.chosenMethod == SwapMethod.swapExactTokensForTokens
            ? calcOnFirstChanged
            : calcOnSecondChanged);

    final amount1 = Decimal.parse(firstAssetAmountController.text)
        .setDecimalsForUserInput(asset1Decimals);
    final amount2 = Decimal.parse(secondAssetAmountController.text)
        .setDecimalsForUserInput(asset2Decimals);

    final firstAmountToSend =
        state.chosenMethod == SwapMethod.swapExactTokensForTokens
            ? amount1.toBigInt()
            : amount2.toBigInt();

    // If first method is choset then set 2nd decimals and opposite
    final secondAmountDecimals =
        state.chosenMethod == SwapMethod.swapExactTokensForTokens
            ? asset2Decimals
            : asset1Decimals;

    final secondAmountToSend = secondAmountToSendResponse.$2
        .setDecimalsForUserInput(secondAmountDecimals)
        .toBigInt();

    return SwapAssetsParams(
      asset1: state.firstAsset,
      asset2: state.secondAsset,
      amount1: firstAmountToSend,
      amount2: secondAmountToSend,
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
      keepAlive: state.keepAlive,
      swapMethod: state.chosenMethod,
    );
  }

  @override
  SafeUseCaseCall<void, SwapAssetsParams> get safeCall => swapAssets.safeCall;
}
