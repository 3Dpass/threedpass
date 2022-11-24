import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/api/types/addressIconData.dart';
import 'package:polkawallet_sdk/api/types/networkParams.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/constants.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_core_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_live_net_plugin.dart';
import 'package:threedpass/core/polkawallet/plugins/d3p_test_net_plugin.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/setup.dart';

part 'init_app_service_extension.dart';

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
            getIt<Logger>().i('Balance updated: ${data.availableBalance}');
            service.balance.value = data;
          },
        ),
      );
    } else {
      getIt<Logger>().i(
        "Couldn't subscribe to balance, because service.keyring.current.address is NULL",
      );
    }
  }

  Future<void> changeNetwork(final WalletSettings walletSettings) async {
    emit(
      state.copyWith(
        status: AppServiceInitStatus.init,
      ),
    );
  }

  // TODO Remove this when do Clean Architecture
  void _emit(final AppService appService) {
    emit(appService);
  }
}
