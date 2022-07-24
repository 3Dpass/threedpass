import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

class AppServiceLoaderCubit extends Cubit<Object> {
  AppServiceLoaderCubit({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) : super('init_status_sdk') {
    _init(polkawalletPlugin: polkawalletPlugin, keyring: keyring);
  }

  Future<Map> importAccount({
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = CryptoType.sr25519,
    String derivePath = '',
    required AccountCreate account,
  }) async {
    if (state is AppService) {
      final appService = state as AppService;

      if ((account.name.isEmpty || account.password.isEmpty)) {
        throw Exception('create account failed');
      }
      final res = await appService.plugin.sdk.api.keyring.importAccount(
        appService.keyring,
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
    } else {
      throw Exception(
        'AppService is not initialized (AppServiceLoaderCubit state runtimeType is ${state.runtimeType})',
      );
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
    if (state is AppService) {
      final appService = state as AppService;

      if ((account.name.isEmpty || account.password.isEmpty)) {
        throw Exception('Accont name or password is empty');
      }
      final res = await appService.plugin.sdk.api.keyring.addAccount(
        appService.keyring,
        keyType: keyType,
        acc: json,
        password: account.password,
      );

      // Refresh state to notify listeners
      emit(
        AppService(appService.plugin, appService.keyring),
      );

      return res;
    } else {
      throw Exception(
        'AppService is not initialized (AppServiceLoaderCubit state runtimeType is ${state.runtimeType})',
      );
    }
  }

  void changeAccount(KeyPairData keyPairData) {
    if (state is AppService) {
      final appService = state as AppService;
      appService.plugin.changeAccount(keyPairData);
      appService.keyring.setCurrent(keyPairData);

      emit(
        AppService(appService.plugin, appService.keyring),
      );
    } else {
      throw Exception(
        'Exception during changeAccount. AppService is not initialized (AppServiceLoaderCubit state runtimeType is ${state.runtimeType})',
      );
    }
  }

  Future<void> _init({
    required PolkawalletPlugin polkawalletPlugin,
    required Keyring keyring,
  }) async {
    await keyring.init([ss58formatLive]);
    await polkawalletPlugin.sdk.init(keyring);

    // Emit string to translate in UI. It describes the status of the initialization
    emit('init_status_connecting_to_node');

    final res =
        await polkawalletPlugin.sdk.api.connectNode(keyring, d3pLiveNodesList);

    if (res != null) {
      emit(AppService(polkawalletPlugin, keyring));
    } else {
      emit('init_status_connecting_to_node_failed');
    }
  }
}
