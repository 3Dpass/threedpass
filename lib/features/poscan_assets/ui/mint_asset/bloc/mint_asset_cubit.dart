import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/mint_asset.dart';

// Fields:
// id id u32 - statful
// amount u128
class MintAssetCubit extends Cubit<void>
    with ExtrinsicShowLoadingMixin<void, MintAssetParams> {
  MintAssetCubit({
    required this.appServiceLoaderCubit,
    required this.mintAsset,
    required this.initialAsset,
    required this.outerRouter,
  })  : admin = appServiceLoaderCubit.state.keyring.current,
        super(null);

  final MintAsset mintAsset;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final int initialAsset;

  KeyPairData admin;

  final TextEditingController amount = TextEditingController();

  void setAcc(final KeyPairData acc) {
    admin = acc;
  }

  @override
  final StackRouter outerRouter;

  @override
  FutureOr<MintAssetParams> params(final BuildContext context) {
    return MintAssetParams(
      account: admin,
      password: passwordController.text,
      amount: BigInt.parse(amount.text),
      assetId: initialAsset, // TODO Change if allow user to choose asset
      updateStatus: () => updateStatus(context),
    );
  }

  @override
  SafeUseCaseCall<void, MintAssetParams> get safeCall => mintAsset.safeCall;
}
