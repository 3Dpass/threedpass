import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:threedpass/core/polkawallet/utils/tx_update_event_logs_handler.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_from_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/bloc/transfers_to_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/usecases/get_transfers.dart';
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

  Future<void> changeAccount(final KeyPairData keyPairData) async {
    emit(state.copyWith(status: AppServiceInitStatus.connecting));

    state.plugin.sdk.api.account.unsubscribeBalance();
    await state.plugin.changeAccount(keyPairData);

    state.keyring.setCurrent(keyPairData);

    final pseudoNewState =
        state.copyWith(status: AppServiceInitStatus.connected);

    await pseudoNewState.subscribeToBalance();

    registerTransferCubits(pseudoNewState);

    emit(pseudoNewState);
  }

  /// Bad code, but who cares?
  void justEmit() {
    emit(state.copyWith());
  }

  Future<void> changeNetwork(final WalletSettings walletSettings) async {
    // TODO Make real network change
    emit(
      state.copyWith(
        status: AppServiceInitStatus.init,
      ),
    );
  }

  // Good id to test '0xc46140845e922cb3c2c10c55b90dc6a959ec5414835fb2d5e8f2bed89e7d4c6f'
  static void registerTransferCubits(final AppService appService) {
    final userPubKey = appService.keyring.current.pubKey ?? '';

    if (getIt.isRegistered<TransfersToCubit>()) {
      getIt.unregister<TransfersToCubit>();
    }
    getIt.registerFactory<TransfersToCubit>(
      () => TransfersToCubit(
        getTransfers: getIt<GetTransfers>(),
        toMultiAddressAccountId: userPubKey,
      ),
    );

    if (getIt.isRegistered<TransfersFromCubit>()) {
      getIt.unregister<TransfersFromCubit>();
    }
    getIt.registerFactory<TransfersFromCubit>(
      () => TransfersFromCubit(
        getTransfers: getIt<GetTransfers>(),
        fromMultiAddressAccountId: userPubKey,
      ),
    );
  }

  void addHandler(
    final String msgId,
    final TransactionsCallback setTransactionResult,
  ) {
    // TODO Remove handler after get result
    state.plugin.sdk.webView!.addGlobalHandler(
      TxUpdateEventLogsHandler(msgId, setTransactionResult),
    );
  }
}
