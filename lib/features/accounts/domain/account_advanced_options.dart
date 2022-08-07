import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/constants.dart';

part 'account_advanced_options.g.dart';

@CopyWith()
class AccountAdvancedOptions {
  final String path;
  final CryptoType type;

  const AccountAdvancedOptions({
    required this.path,
    required this.type,
  });

  const AccountAdvancedOptions.defaultValues()
      : path = '',
        type = defaultCryptoType;
}
