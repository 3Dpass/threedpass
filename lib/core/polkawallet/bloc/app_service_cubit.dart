import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

///
/// BE CAREFUL when you write [buildWhen] for this cubit.
/// AppService's plugin and keyring are always the same instance!
/// This class does [emit] just to notify listeners to rebuild widgets
///
class AppServiceLoaderCubit extends Cubit<AppService> {
  AppServiceLoaderCubit({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) : super(
          AppService(
            plugin: polkawalletPlugin,
            keyring: keyring,
            status: AppServiceInitStatus.init,
          ),
        ) {
    _init();
  }

  Future<Map> importAccount({
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = CryptoType.sr25519,
    String derivePath = '',
    required AccountCreate account,
  }) async {
    if ((account.name.isEmpty || account.password.isEmpty)) {
      throw Exception('create account failed');
    }
    final res = await state.plugin.sdk.api.keyring.importAccount(
      state.keyring,
      keyType: keyType,
      cryptoType: cryptoType,
      derivePath: derivePath,
      key: account.mnemonicKey,
      name: account.name,
      password: account.password,
    );

    if (res != null) {
      return res;
    } else {
      throw Exception('Account was NOT imported');
    }
  }

  Future<KeyPairData> addAccount({
    required Map json,
    required AccountCreate account,
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = CryptoType.sr25519,
    String derivePath = '',
    bool isFromCreatePage = false,
  }) async {
    if ((account.name.isEmpty || account.password.isEmpty)) {
      throw Exception('Accont name or password is empty');
    }
    final res = await state.plugin.sdk.api.keyring.addAccount(
      state.keyring,
      keyType: keyType,
      acc: json,
      password: account.password,
    );

    emit(state.copyWith());

    return res;
  }

  void changeAccount(KeyPairData keyPairData) {
    state.plugin.changeAccount(keyPairData);
    state.keyring.setCurrent(keyPairData);

    emit(state.copyWith());
  }

  Future<void> _init() async {
    await state.keyring.init([ss58formatLive]);
    await state.plugin.sdk.init(state.keyring);

    emit(state.copyWith(status: AppServiceInitStatus.connecting));

    final res =
        await state.plugin.sdk.api.connectNode(state.keyring, d3pLiveNodesList);

    emit(
      state.copyWith(
        status: res != null
            ? AppServiceInitStatus.connected
            : AppServiceInitStatus.error,
      ),
    );
  }
}
