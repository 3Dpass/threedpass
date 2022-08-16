import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_live_net_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_test_net_plugin.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

///
/// BE CAREFUL when you write [buildWhen] for this cubit.
/// AppService's plugin and keyring are always the same instance!
/// This class does [emit] just to notify listeners to rebuild widgets
///
class AppServiceLoaderCubit extends Cubit<AppService> {
  AppServiceLoaderCubit({
    required WalletSettings walletSettings,
  }) : super(
          AppService(
            plugin: D3pTestNetPlugin(),
            keyring: Keyring(),
            status: AppServiceInitStatus.init,
          ),
        ) {
    init(walletSettings);
  }

  Future<Map> importAccount({
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = defaultCryptoType,
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
    CryptoType cryptoType = defaultCryptoType,
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

  Future<void> init(WalletSettings walletSettings) async {
    // state.plugin.sdk.webView?.dispose();
    // // Refresh appService
    // final appService = AppService(
    //   plugin:
    //       walletSettings.isTestNet ? D3pTestNetPlugin() : D3pLiveNetPlugin(),
    //   keyring: Keyring(),
    //   status: AppServiceInitStatus.init,
    // );
    // emit(appService);

    final appService = state;

    // Init
    await appService.keyring.init([
      walletSettings.isTestNet ? ss58formatTest : ss58formatLive,
    ]);
    await appService.plugin.sdk.init(state.keyring);

    emit(appService.copyWith(status: AppServiceInitStatus.connecting));

    // Connect
    final res = await state.plugin.sdk.api.connectNode(
      state.keyring,
      d3pLiveNodesList,
    );

    emit(
      state.copyWith(
        status: res != null
            ? AppServiceInitStatus.connected
            : AppServiceInitStatus.error,
      ),
    );
  }
}
