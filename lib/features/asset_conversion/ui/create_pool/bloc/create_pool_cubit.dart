import 'package:auto_route/auto_route.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/usecase.dart';
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
    with ExtrinsicShowLoadingMixin<void, CreatePoolParams> {
  @override
  final StackRouter outerRouter;
  final KeyPairData account;
  final CreatePool createPoolUseCase;

  CreatePoolCubit({
    required final AppServiceLoaderCubit appServiceLoaderCubit,
    required this.createPoolUseCase,
    required this.outerRouter,
  })  : account = appServiceLoaderCubit.state.keyring.current,
        super(const CreatePoolState.initial());

  @override
  SafeUseCaseCall<void, CreatePoolParams> get safeCall =>
      createPoolUseCase.safeCall;

  void setAsset1(final PoolAssetField? value) {
    emit(state.copyWith(asset1: value));
  }

  void setAsset2(final PoolAssetField? value) {
    emit(state.copyWith(asset2: value));
  }

  @override
  CreatePoolParams params(final BuildContext context) => CreatePoolParams(
        asset1: state.asset1,
        asset2: state.asset2,
        updateStatus: () => updateStatus(context),
        account: account,
        password: passwordController.text,
      );
}
