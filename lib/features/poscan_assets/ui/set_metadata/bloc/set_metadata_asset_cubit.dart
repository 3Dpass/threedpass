import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/set_metadata.dart';

// part 'set_metadata_asset_cubit.g.dart';

// Fields:
// asset id u32 - statful
// name ascii
// symbol ascii
// decimals u8 0 <= u8 <= 255
class SetMetadataAssetCubit extends Cubit<void>
    with ExtrinsicShowLoadingMixin<void, SetMetadataParams> {
  SetMetadataAssetCubit({
    required this.appServiceLoaderCubit,
    required this.setMetadata,
    required this.initialAssetId,
    required this.outerRouter,
  })  : admin = appServiceLoaderCubit.state.keyring.current,
        super(null);

  final SetMetadata setMetadata;
  final KeyPairData admin;
  final int initialAssetId;

  final TextEditingController name = TextEditingController();
  final TextEditingController symbol = TextEditingController();
  final TextEditingController decimals = TextEditingController();

  final AppServiceLoaderCubit appServiceLoaderCubit;

  @override
  final StackRouter outerRouter;

  @override
  FutureOr<SetMetadataParams> params(final BuildContext context) =>
      SetMetadataParams(
        admin: admin,
        password: passwordController.text,
        assetId: initialAssetId, // TODO Change if allow user to choose asset
        name: name.text,
        symbol: symbol.text,
        decimals: int.parse(decimals.text),
        updateStatus: () => updateStatus(context),
      );

  @override
  SafeUseCaseCall<void, SetMetadataParams> get safeCall => setMetadata.safeCall;
}
