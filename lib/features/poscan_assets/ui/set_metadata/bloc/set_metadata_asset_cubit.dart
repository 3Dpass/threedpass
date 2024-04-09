import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';

// part 'set_metadata_asset_cubit.g.dart';

// Fields:
// asset id u32 - statful
// name ascii
// symbol ascii
// decimals u8 0 <= u8 <= 255
class SetMetadataAssetCubit extends Cubit<void> {
  SetMetadataAssetCubit({
    required final KeyPairData initialAccount,
    required this.appServiceLoaderCubit,
  })  : initialAcc = initialAccount,
        admin = initialAccount,
        super(null);

  final TextEditingController name = TextEditingController();
  final TextEditingController symbol = TextEditingController();
  final TextEditingController decimals = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AppServiceLoaderCubit appServiceLoaderCubit;

  final KeyPairData initialAcc;
  KeyPairData admin;

  void setAcc(final KeyPairData acc) {
    admin = acc;
  }

  Future<void> setMetadata() async {
    if (formKey.currentState!.validate()) {}
    // appServiceLoaderCubit.state;
  }
}
