import 'package:polkawallet_sdk/api/apiAccount.dart';
import 'package:polkawallet_sdk/api/apiAssets.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

class AppService {
  AppService(this.plugin, this.keyring)
      : _assets = plugin.sdk.api.assets,
        _account = plugin.sdk.api.account;

  // final List<PolkawalletPlugin> allPlugins;
  final PolkawalletPlugin plugin;
  final Keyring keyring;
  // final AppStore store;

  final ApiAccount _account;
  final ApiAssets _assets;

  ApiAccount get account => _account;
  ApiAssets get assets => _assets;

  // final subScan = SubScanApi();
}
