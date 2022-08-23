import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';
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
    _init(walletSettings);
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

    // TODO Set testNet parameter to settings. Disable it in settings page

    emit(state.copyWith());

    return res;
  }

  void changeAccount(KeyPairData keyPairData) {
    state.plugin.changeAccount(keyPairData);
    state.keyring.setCurrent(keyPairData);

    emit(state.copyWith());
  }

  Future<void> _startPlugin(AppService service, {NetworkParams? node}) async {
    final connected = await service.plugin.start(
      state.keyring,
      nodes: node != null ? [node] : service.plugin.nodeList,
    );

    emit(
      state.copyWith(
        status: connected != null
            ? AppServiceInitStatus.connected
            : AppServiceInitStatus.error,
      ),
    );
  }

  static D3pCorePlugin _buildPlugin(WalletSettings walletSettings) {
    return walletSettings.isTestNet
        ? D3pTestNetPlugin(nodeUrl: walletSettings.nodeUrl)
        : D3pLiveNetPlugin(nodeUrl: walletSettings.nodeUrl);
  }

  Future<void> changeNetwork(WalletSettings walletSettings) async {
    emit(
      state.copyWith(
        status: AppServiceInitStatus.init,
      ),
    );

    final newPlugin = _buildPlugin(walletSettings);

    state.keyring.setSS58(newPlugin.basic.ss58!);
    // Documentation says "we don't really need this method"
    await state.plugin.dispose();

    await newPlugin.beforeStart(
      state.keyring,
      webView: state.plugin.sdk.webView,
      // !This method is guaranteed to fall with an error, so we provide
      // callback to reconnect
      socketDisconnectedAction: () {
        newPlugin.start(state.keyring);
      },
    );

    _startPlugin(
      AppService(
        plugin: newPlugin,
        keyring: state.keyring,
        status: AppServiceInitStatus.connecting,
      ),
    );
  }

  Future<void> _init(WalletSettings walletSettings) async {
    final keyring = state.keyring;
    // Init
    await keyring.init([ss58formatTest, ss58formatLive]);

    final appService = AppService(
      plugin: _buildPlugin(walletSettings),
      keyring: keyring,
      status: AppServiceInitStatus.connecting,
    );

    await appService.plugin.beforeStart(
      keyring,
      webView: appService.plugin.sdk.webView,
    );

    emit(appService);

    _startPlugin(appService);
  }
}
