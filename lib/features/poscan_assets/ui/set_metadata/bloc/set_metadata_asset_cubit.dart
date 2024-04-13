import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/set_metadata.dart';

// part 'set_metadata_asset_cubit.g.dart';

// Fields:
// asset id u32 - statful
// name ascii
// symbol ascii
// decimals u8 0 <= u8 <= 255
class SetMetadataAssetCubit extends Cubit<void> {
  SetMetadataAssetCubit({
    required this.appServiceLoaderCubit,
    required this.setMetadata,
    required this.initialAssetId,
  })  : admin = appServiceLoaderCubit.state.keyring.current,
        super(null);

  final SetMetadata setMetadata;
  final KeyPairData admin;
  final int initialAssetId;

  final TextEditingController name = TextEditingController();
  final TextEditingController symbol = TextEditingController();
  final TextEditingController decimals = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<void> submitExtrinsic() async {
    if (formKey.currentState!.validate()) {}
    // appServiceLoaderCubit.state;
  }
}
