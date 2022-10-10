import 'package:copy_with_extension/copy_with_extension.dart';

part 'account_info.g.dart';

abstract class AccountInfo {
  final String name;
  final String password;

  const AccountInfo({
    required this.name,
    required this.password,
  });

  const AccountInfo.intial()
      : name = '',
        password = '';

  AccountInfo copyWithTyped({
    final String? name,
    final String? password,
    final String? mnemonicKey,
    final String? seedKey,
  }) {
    if (this is AccountCreateMnemonic) {
      return (this as AccountCreateMnemonic).copyWith(
        name: name,
        password: password,
        mnemonic: mnemonicKey,
      );
    } else if (this is AccountCreateSeed) {
      return (this as AccountCreateSeed).copyWith(
        name: name,
        password: password,
        seed: seedKey,
      );
    } else {
      throw Exception('Unknown AccountInfo type');
    }
  }
}

@CopyWith()
class AccountCreateMnemonic extends AccountInfo {
  final String mnemonic;

  const AccountCreateMnemonic({
    required this.mnemonic,
    required final String name,
    required final String password,
  }) : super(name: name, password: password);

  const AccountCreateMnemonic.intial()
      : mnemonic = '',
        super.intial();
}

@CopyWith()
class AccountCreateSeed extends AccountInfo {
  final String seed;

  const AccountCreateSeed({
    required this.seed,
    required final String name,
    required final String password,
  }) : super(name: name, password: password);

  const AccountCreateSeed.intial()
      : seed = '',
        super.intial();
}

// Short cuts :)
extension S on AccountInfo {
  String get mnemonicKey {
    return (this as AccountCreateMnemonic).mnemonic;
  }

  String get seedKey {
    return (this as AccountCreateSeed).seed;
  }
}
