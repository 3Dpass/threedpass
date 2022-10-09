import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';

class FullAccountContext {
  final AccountInfo account;
  final KeyType keyType;
  final AccountAdvancedOptions advancedOptions;

  const FullAccountContext({
    required this.account,
    required this.keyType,
    required this.advancedOptions,
  });

  Future<void> createAccount(
    final AppServiceLoaderCubit appServiceLoaderCubit,
    final void Function() onDuplicate,
  ) async {
    final accJson = await appServiceLoaderCubit.importAccount(
      account: account,
      keyType: keyType,
      cryptoType: advancedOptions.type,
      derivePath: advancedOptions.path,
    );

    // DefaultLoadingDialog.hide(context);

    final duplicated = _checkAccountDuplicate(
      appServiceLoaderCubit.state,
      accJson['pubKey'] as String,
    );

    if (!duplicated) {
      final keyPairData = await appServiceLoaderCubit.addAccount(
        json: accJson,
        account: account,
        keyType: keyType,
        cryptoType: advancedOptions.type,
        derivePath: advancedOptions.path,
      );

      // apply current account
      appServiceLoaderCubit.changeAccount(keyPairData);
    }
  }

  static bool _checkAccountDuplicate(
    final AppService service,
    final String pubKey,
  ) {
    final index =
        service.keyring.keyPairs.indexWhere((final i) => i.pubKey == pubKey);

    return index > -1;
  }
}
