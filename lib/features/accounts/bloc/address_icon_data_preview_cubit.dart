import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

class AddressIconDataPreviewCubit extends Cubit<AddressIconData?> {
  AddressIconDataPreviewCubit(this.appServiceCubit) : super(null);

  final AppServiceLoaderCubit appServiceCubit;

  Future<void> updateInfo(
    String inputMnemonic, {
    CryptoType cryptoType = defaultCryptoType,
    String derivePath = '',
  }) async {
    final addressInfo =
        await appServiceCubit.state.plugin.sdk.api.keyring.addressFromMnemonic(
      appServiceCubit.state.plugin.basic.ss58!,
      cryptoType: cryptoType,
      derivePath: derivePath,
      mnemonic: inputMnemonic,
    );

    emit(addressInfo);
  }

  void dropInfo() {
    emit(null);
  }
}
