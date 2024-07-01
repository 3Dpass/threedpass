import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';

class RemoveLiquidityCubit extends Cubit<void> with ExtrinsicShowLoadingMixin {
  RemoveLiquidityCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required final PoolFullInfo poolFullInfo,
    required this.removeLiquidityUseCase,
    required this.outerRouter,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        asset1 = poolFullInfo.basicInfo.firstAsset,
        asset2 = poolFullInfo.basicInfo.secondAsset,
        super(null);

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final RemoveLiquidity removeLiquidityUseCase;
  final PoolAssetField asset1;
  final PoolAssetField asset2;

  final passwordController = TextEditingController();
  final lpTokenBurn = TextEditingController();
  final amount1MinRecieve = TextEditingController();
  final amount2MinRecieve = TextEditingController();

  @override
  Future<Either<Failure, void>> callExtrinsic(final BuildContext context) {
    final params = RemoveLiquidityParams(
      asset1: asset1,
      asset2: asset2,
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
