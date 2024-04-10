import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/mint_asset.dart';

// Fields:
// id id u32 - statful
// amount u128
class MintAssetCubit extends Cubit<void> {
  MintAssetCubit({
    required this.appServiceLoaderCubit,
    required this.mintAsset,
  })  : admin = appServiceLoaderCubit.state.keyring.current,
        super(null);

  final MintAsset mintAsset;

  final TextEditingController amount = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AppServiceLoaderCubit appServiceLoaderCubit;

  KeyPairData admin;

  void setAcc(final KeyPairData acc) {
    admin = acc;
  }

  Future<void> submitExtrinsic() async {
    if (formKey.currentState!.validate()) {}
    // appServiceLoaderCubit.state;
  }
}
