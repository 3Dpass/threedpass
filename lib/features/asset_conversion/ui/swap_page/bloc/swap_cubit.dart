import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/network_state_data_extension.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/swap_method.dart';

part 'swap_cubit.freezed.dart';

@Freezed(
  equal: false,
  copyWith: true,
  toJson: false,
  fromJson: false,
  toStringOverride: false,
)
class SwapState with _$SwapState {
  // final PoolAssetField firstAsset;
  // final PoolAssetField secondAsset;
  // final SwapMethod chosenMethod;

  // const SwapState({
  //   required this.firstAsset,
  //   required this.secondAsset,
  //   required this.chosenMethod,
  // });

  const factory SwapState({
    required final PoolAssetField firstAsset,
    required final PoolAssetField secondAsset,
    required final SwapMethod chosenMethod,
  }) = _SwapState;
}

class SwapCubit extends Cubit<SwapState> with ExtrinsicShowLoadingMixin {
  SwapCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.poolAssets,
    required this.outerRouter,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        nativeTokenDecimals =
            appServiceLoaderCubit.state.networkStateData.safeDecimals,
        super(
          SwapState(
            firstAsset: poolAssets.first,
            secondAsset: poolAssets[1],
            chosenMethod: SwapMethod.swapExactTokensForTokens,
          ),
        ) {
    // setPercentage(state.percentage);
    // calcMaxPercent();
  }

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final int nativeTokenDecimals;

  final List<PoolAssetField> poolAssets;

  final firstAssetAmountController = TextEditingController();
  final secondAssetAmountController = TextEditingController();

  void setChosenMethod(final SwapMethod chosenMethod) {
    emit(
      state.copyWith(chosenMethod: chosenMethod),
    );
  }

  void setFirstAsset(final PoolAssetField asset) {
    emit(state.copyWith(firstAsset: asset));
  }

  void setSecondAsset(final PoolAssetField asset) {
    emit(state.copyWith(secondAsset: asset));
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(BuildContext context) {
    // TODO: implement callExtrinsic
    throw UnimplementedError();
  }
}
