import 'package:copy_with_extension/copy_with_extension.dart';

part 'account_create.g.dart';

abstract class AccountCreate {
  final String name;
  final String password;

  const AccountCreate({
    required this.name,
    required this.password,
  });

  const AccountCreate.intial()
      : name = '',
        password = '';

  AccountCreate copyWithTyped({
    String? name,
    String? password,
    String? mnemonicKey,
    String? seedKey,
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
      throw Exception('Unknown AccountCreate type');
    }
  }
}

@CopyWith()
class AccountCreateMnemonic extends AccountCreate {
  final String mnemonic;

  const AccountCreateMnemonic({
    required this.mnemonic,
    required String name,
    required String password,
  }) : super(name: name, password: password);

  const AccountCreateMnemonic.intial()
      : mnemonic = '',
        super.intial();
}

@CopyWith()
class AccountCreateSeed extends AccountCreate {
  final String seed;

  const AccountCreateSeed({
    required this.seed,
    required String name,
    required String password,
  }) : super(name: name, password: password);

  const AccountCreateSeed.intial()
      : seed = '',
        super.intial();
}

// Short cuts :)
extension S on AccountCreate {
  String get mnemonicKey {
    return (this as AccountCreateMnemonic).mnemonic;
  }

  String get seedKey {
    return (this as AccountCreateSeed).seed;
  }
}
