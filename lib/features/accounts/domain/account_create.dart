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
}

@CopyWith()
class AccountCreateMnemonic extends AccountCreate {
  final String mnemonicKey;

  const AccountCreateMnemonic({
    required this.mnemonicKey,
    required String name,
    required String password,
  }) : super(name: name, password: password);

  const AccountCreateMnemonic.intial()
      : mnemonicKey = '',
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
