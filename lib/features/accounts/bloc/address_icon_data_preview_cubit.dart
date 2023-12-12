import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

class AddressIconDataPreviewCubit extends Cubit<AddressIconData?> {
  AddressIconDataPreviewCubit(this.appServiceCubit) : super(null);

  final AppServiceLoaderCubit appServiceCubit;

  Future<void> updateInfo(
    final String inputMnemonic, {
    final CryptoType cryptoType = defaultCryptoType,
    final String derivePath = '',
  }) async {
    final addressInfo =
        await appServiceCubit.state.plugin.sdk.api.keyring.addressFromMnemonic(
      appServiceCubit.state.networkStateData.ss58Format!,
      cryptoType: cryptoType,
      derivePath: derivePath,
      mnemonic: inputMnemonic,
    );

    emit(addressInfo);
  }

  Future<void> updateInfoFromRawseed(
      final String inputRawseed, {
        final CryptoType cryptoType = defaultCryptoType,
        final String derivePath = '',
      }) async {
    final addressInfo =
    await appServiceCubit.state.plugin.sdk.api.keyring.addressFromRawSeed(
      appServiceCubit.state.networkStateData.ss58Format!,
      cryptoType: cryptoType,
      derivePath: derivePath,
      rawSeed: inputRawseed,
    );

    emit(addressInfo);
  }

  void dropInfo() {
    emit(null);
  }
}
