import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:polkawallet_sdk/api/types/networkStateData.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:threedpass/core/polkawallet/non_native_tokens_api.dart';
import 'package:threedpass/setup.dart';

part 'app_service.g.dart';

@CopyWith()
class AppService {
  AppService({
    required this.plugin,
    required this.keyring,
    required this.status,
    final NetworkStateData? networkStateData,
  })  : networkStateData = networkStateData ?? NetworkStateData(),
        chosenAccountBalance = ValueNotifier<BalanceData>(BalanceData()),
        tokensAreLoading = ValueNotifier<bool>(false);

  final ValueNotifier<BalanceData> chosenAccountBalance;
  final ValueNotifier<bool> tokensAreLoading;
  // final ValueNotifier<String> bestNumber = ValueNotifier<String>('');
  final Keyring keyring;
  final NetworkStateData networkStateData;
  final PolkawalletPlugin plugin;
  final AppServiceInitStatus status;

  /// Sets balances and data for assets
  /// Should be called in 3 cases:
  /// 1. Start app. Init account.
  /// 2. Change account. Calculate new balances
  /// 3. Transfer sent
  Future<void> _setTokensData(final String address) async {
    if (keyring.current.address != null) {
      // Get tokens only if there is an account
      final nnta = NonNativeTokensApi(this, address);
    }
  }

  Future<void> subscribeToBalance() async {
    final address = keyring.current.address;

    plugin.sdk.api.account.unsubscribeBalance();

    // plugin.sdk.webView.
    // serviceRoot.webView!.addMsgHandler(msgId, onStatusChange);

    if (address != null) {
      unawaited(
        plugin.sdk.api.account.subscribeBalance(
          address,
          (final data) async {
            getIt<Logger>().i('Balance updated: ${data.availableBalance}');

            if (keyring.current.address == data.accountId) {
              chosenAccountBalance.value = data;
            }

            tokensAreLoading.value = true;
            await _setTokensData(address);
            tokensAreLoading.value = false;
          },
        ),
      );
    } else {
      getIt<Logger>().i(
        "Couldn't subscribe to balance, because service.keyring.current.address is NULL",
      );
    }
  }
  // final subScan = SubScanApi();
}

enum AppServiceInitStatus {
  init,
  connecting,
  connected,
  // error means failure to connect to node
  error,
}
