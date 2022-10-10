import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_live_net_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_test_net_plugin.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/scan_page/bloc/object_from_file_cubit.dart';
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
    required this.bestNumberAvaliableCubit,
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
  final BestNumberAvaliableCubit bestNumberAvaliableCubit;

  Future<Map<dynamic, dynamic>> importAccount({
    required final AccountInfo account,
    final KeyType keyType = KeyType.mnemonic,
    final CryptoType cryptoType = defaultCryptoType,
    final String derivePath = '',
  }) async {
    if (account.name.isEmpty) {
      throw Exception('create account failed');
    }
    final res = await state.plugin.sdk.api.keyring.importAccount(
      state.keyring,
      keyType: keyType,
      cryptoType: cryptoType,
      derivePath: derivePath,
      key: keyType == KeyType.mnemonic ? account.mnemonicKey : account.seedKey,
      name: account.name,
      password: account.password,
    );

    if (res != null) {
      return res;
    } else {
      throw Exception('Account was NOT imported');
    }
  }

  static Future<AddressIconData> _getAddressForAccount({
    required final AppService state,
    required final AccountInfo account,
    final CryptoType cryptoType = defaultCryptoType,
    final String derivePath = '',
  }) async {
    if (account is AccountCreateMnemonic) {
      return state.plugin.sdk.api.keyring.addressFromMnemonic(
        state.networkStateData.ss58Format!,
        cryptoType: cryptoType,
        derivePath: derivePath,
        mnemonic: account.mnemonic,
      );
    } else if (account is AccountCreateSeed) {
      return state.plugin.sdk.api.keyring.addressFromRawSeed(
        state.networkStateData.ss58Format!,
        cryptoType: cryptoType,
        derivePath: derivePath,
        rawSeed: account.seed,
      );
    } else {
      throw Exception(
        'AccountInfo has undefined type AppserviceLoaderCubit._getAddressForAccount',
      );
    }
  }

  Future<KeyPairData> addAccount({
    required final Map<dynamic, dynamic> json,
    required final AccountInfo account,
    final KeyType keyType = KeyType.mnemonic,
    final CryptoType cryptoType = defaultCryptoType,
    final String derivePath = '',
    final bool isFromCreatePage = false,
  }) async {
    if (account.name.isEmpty) {
      throw Exception('Accont name or password is empty');
    }
    // try {
    final addressInfo = await _getAddressForAccount(
      state: state,
      account: account,
      cryptoType: cryptoType,
      derivePath: derivePath,
    );

    json['address'] = addressInfo.address;

    final res = await state.plugin.sdk.api.keyring.addAccount(
      state.keyring,
      keyType: keyType,
      acc: json,
      password: account.password,
    );

    // This variable is never used, but somehow this line solves bug
    // when [keyring.importAccount] returns wrong address.

    state.keyring.current.address = addressInfo.address;
    state.keyring.current.icon = addressInfo.svg;

    emit(state.copyWith());

    return res;
    // } catch (e) {
    //   rethrow;
    //   // final a = state.plugin.sdk.api.account.queryIndexInfo();
    //   // return KeyPairData();
    // }
  }

  void changeAccount(final KeyPairData keyPairData) {
    state.plugin.sdk.api.account.unsubscribeBalance();

    state.plugin.changeAccount(keyPairData);
    state.keyring.setCurrent(keyPairData);

    final pseudoNewState = state.copyWith();

    subscribeToBalance(pseudoNewState);

    emit(pseudoNewState);
  }

  /// Connects to node, subscribes to balance and blocks updates.
  /// Emits new state of [AppService]
  Future<void> _startPlugin(
    final AppService service, {
    final NetworkParams? node,
  }) async {
    // ignore: unused_local_variable
    final connected = await service.plugin.sdk.api.connectNode(
      service.keyring,
      node != null ? [node] : service.plugin.nodeList,
    );

    final newAppService = await _buildNewAppServiceWithProperties(service);

    unawaited(
      newAppService.plugin.sdk.api.setting
          .subscribeBestNumber((final String value) {
        newAppService.bestNumber.value = value;
        bestNumberAvaliableCubit.setValue(true);
      }),
    );

    unawaited(subscribeToBalance(newAppService));

    emit(newAppService);
  }

  /// Gets network properties from node and creates new [AppService] instance
  /// with those properties and connection state.
  /// It sets error message if could not get network properties.
  Future<AppService> _buildNewAppServiceWithProperties(
    final AppService oldAppService,
  ) async {
    final networkData =
        await oldAppService.plugin.sdk.api.setting.queryNetworkProps();

    // ignore: unused_local_variable
    final consts = await oldAppService.plugin.sdk.api.setting
        .queryNetworkConst(); // TODO Save this data to AppService

    late final AppService newAppService;

    // One time the condition was [if (connected != null && networkData != null)]
    // but something happened when I forked the polkawallet_sdk repo
    // https://github.com/L3odr0id/polkawallet_sdk
    // And now [sdk.api.connectNode(...)] always returns null
    // So I changed it to [if (networkData != null)]
    // If you update the sdk, you may want to change it back
    // TODO?
    if (networkData != null) {
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
        networkStateData: networkData,
        status: AppServiceInitStatus.error,
      );
    }

    return newAppService;
  }

  /// Bad code, but who cares?
  void justEmit() {
    emit(state.copyWith());
  }

  static Future<void> subscribeToBalance(final AppService service) async {
    final address = service.keyring.current.address;
    if (address != null) {
      unawaited(
        service.plugin.sdk.api.account.subscribeBalance(
          address,
          (final data) {
            logger.i('Balance updated: ${data.availableBalance}');
            service.balance.value = data;
          },
        ),
      );
    } else {
      logger.i(
        "Couldn't subscribe to balance, because service.keyring.current.address is NULL",
      );
    }
  }

  static D3pCorePlugin _buildPlugin(final WalletSettings walletSettings) {
    return walletSettings.isTestNet
        ? D3pTestNetPlugin(nodeUrl: walletSettings.nodeUrl)
        : D3pLiveNetPlugin(nodeUrl: walletSettings.nodeUrl);
  }

  Future<void> changeNetwork(final WalletSettings walletSettings) async {
    emit(
      state.copyWith(
        status: AppServiceInitStatus.init,
      ),
    );
  }

  Future<void> _init(final WalletSettings walletSettings) async {
    final keyring = state.keyring;
    // Init
    await keyring.init([ss58formatLive, ss58formatTest]);

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
    unawaited(_startPlugin(appService));
  }
}
