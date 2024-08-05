import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/either.dart';
import 'package:super_core/failure.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';

part 'create_pool_cubit.g.dart';

@CopyWith()
class CreatePoolState {
  final PoolAssetField asset1;
  final PoolAssetField asset2;

  const CreatePoolState({
    required this.asset1,
    required this.asset2,
  });

  const CreatePoolState.initial()
      : asset1 = const PoolAssetField.native(),
        asset2 = const PoolAssetField.native();
}

class CreatePoolCubit extends Cubit<CreatePoolState>
    with ExtrinsicShowLoadingMixin {
  CreatePoolCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.createPoolUseCase,
    required this.outerRouter,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        super(const CreatePoolState.initial());

  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final CreatePool createPoolUseCase;

  void setAsset1(final PoolAssetField? value) {
    emit(state.copyWith(asset1: value));
  }

  void setAsset2(final PoolAssetField? value) {
    emit(state.copyWith(asset2: value));
  }

  @override
  Future<Either<Failure, void>> callExtrinsic(final BuildContext context) {
    final params = CreatePoolParams(
      asset1: state.asset1,
      asset2: state.asset2,
      account: account,
      password: passwordController.text,
      updateStatus: () => updateStatus(context),
    );
    final res = createPoolUseCase.call(params);
    return res;
  }
}
