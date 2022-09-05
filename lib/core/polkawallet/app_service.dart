import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_sdk/api/types/balanceData.dart';
import 'package:polkawallet_sdk/api/types/networkStateData.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

part 'app_service.g.dart';

@CopyWith()
class AppService {
  AppService({
    required this.plugin,
    required this.keyring,
    required this.status,
    NetworkStateData? networkStateData,
  })  : networkStateData = networkStateData ?? NetworkStateData(),
        balance = ValueNotifier<BalanceData>(BalanceData());

  final PolkawalletPlugin plugin;
  final Keyring keyring;
  final AppServiceInitStatus status;
  final NetworkStateData networkStateData;
  final ValueNotifier<BalanceData> balance;
  final ValueNotifier<String> bestNumber = ValueNotifier<String>('');

  // final subScan = SubScanApi();
}

enum AppServiceInitStatus {
  init,
  connecting,
  connected,
  // error means failure to connect to node
  error,
}
