import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/keyringEVM.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_live_net_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_test_net_plugin.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

///
/// BE CAREFUL when you write [buildWhen] for this cubit.
/// AppService's plugin and keyring are always the same instance!
/// This class does [emit] just to notify listeners to rebuild widgets
///
class AppServiceLoaderCubit extends Cubit<AppService> {
  AppServiceLoaderCubit({
    required this.settingsConfigCubit,
  }) : super(
          AppService(
            plugin: D3pLiveNetPlugin(),
            keyring: Keyring(),
            status: AppServiceInitStatus.init,
          ),
        ) {
    _init(settingsConfigCubit.state.walletSettings);
  }

  final SettingsConfigCubit settingsConfigCubit;

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

    // This variable is never used, but somehow this line solves bug
    // when [keyring.importAccount] returns wrong address.
    final addressInfo = await state.plugin.sdk.api.keyring.addressFromMnemonic(
      state.plugin.basic.ss58!,
      cryptoType: cryptoType,
      derivePath: derivePath,
      mnemonic: account.mnemonicKey,
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
    final connected = await service.plugin.sdk.api.connectNode(
      service.keyring,
      node != null ? [node] : service.plugin.nodeList,
    );

    final networkData =
        await service.plugin.sdk.api.setting.queryNetworkProps();

    late final AppService newAppService;

    if (connected != null && networkData != null) {
      // If you connected to test node and local settings are live or
      // you connected to live node and local settings are test,
      // then you need to change settings
      final currentWalletSettings = settingsConfigCubit.state.walletSettings;
      final isNodeTestNet = networkData.ss58Format == ss58formatTest;
      if (currentWalletSettings.isTestNet != isNodeTestNet) {
        settingsConfigCubit.updateSettings(
          settingsConfigCubit.state.copyWith(
            walletSettings: currentWalletSettings.copyWith(
              isTestNet: isNodeTestNet,
            ),
          ),
        );
      }

      newAppService = AppService(
        plugin: state.plugin,
        keyring: state.keyring,
        status: AppServiceInitStatus.connected,
        networkStateData: networkData,
      );
    } else {
      newAppService = AppService(
        plugin: state.plugin,
        keyring: state.keyring,
        status: AppServiceInitStatus.error,
      );
    }

    _subscribeToBalance(newAppService);

    // final connected = await service.plugin.start(
    //   state.keyring,
    //   nodes: node != null ? [node] : service.plugin.nodeList,
    // );

    emit(newAppService);
  }

  static void _subscribeToBalance(AppService service) {
    final address = service.keyring.current.address;
    if (address != null) {
      service.plugin.sdk.api.account.subscribeBalance(
        address,
        (data) {
          service.balance.value = data;
        },
      );
    } else {
      logger.w(
        "Couldn't subscribe to balance, because service.keyring.current.address is NULL",
      );
    }
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

    state.plugin.sdk.api.account.unsubscribeBalance();

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
    await keyring.init([ss58formatLive, ss58formatTest]);

    final appService = AppService(
      plugin: _buildPlugin(walletSettings),
      keyring: keyring,
      status: AppServiceInitStatus.connecting,
    );

    // await appService.plugin.sdk
    //     .init(keyring, webView: appService.plugin.sdk.webView);

    // try {
    //   await appService.plugin.sdk.webView?.launch(
    //     () {},
    //     socketDisconnectedAction: () {
    //       emit(appService);
    //       _startPlugin(appService);
    //     },
    //   );
    // } catch (e) {}

    // final b = 1 + 1;

    await appService.plugin.beforeStart(
      keyring,
      webView: appService.plugin.sdk.webView,
    );

    emit(appService);
    _startPlugin(appService);
  }
}
