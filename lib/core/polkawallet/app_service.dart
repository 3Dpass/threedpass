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

  Future<Map> importAccount({
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = CryptoType.sr25519,
    String derivePath = '',
    required AccountCreate account,
  }) async {
    if ((account.name.isEmpty || account.password.isEmpty)) {
      throw Exception('create account failed');
    }
    final res = await plugin.sdk.api.keyring.importAccount(
      keyring,
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

  // TODO Move to appServiceLoader cubit && emit new state
  Future<KeyPairData> addAccount({
    required Map json,
    required AccountCreate account,
    KeyType keyType = KeyType.mnemonic,
    CryptoType cryptoType = CryptoType.sr25519,
    String derivePath = '',
    bool isFromCreatePage = false,
  }) async {
    if ((account.name.isEmpty || account.password.isEmpty)) {
      throw Exception('save account failed');
    }
    final res = await plugin.sdk.api.keyring.addAccount(
      keyring,
      keyType: keyType,
      acc: json,
      password: account.password,
    );
    return res;
  }
}
