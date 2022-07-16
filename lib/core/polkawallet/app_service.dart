import 'package:polkawallet_sdk/api/apiAccount.dart';
import 'package:polkawallet_sdk/api/apiAssets.dart';
import 'package:polkawallet_sdk/api/subscan.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/service/account.dart';
import 'package:polkawallet_sdk/storage/keyring.dart';

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
