import 'package:copy_with_extension/copy_with_extension.dart';

part 'account_create.g.dart';

@CopyWith()
class AccountCreate {
  final String name;
  final String password;
  final String mnemonicKey;

  const AccountCreate({
    required this.mnemonicKey,
    required this.name,
    required this.password,
  });

  const AccountCreate.intial()
      : name = '',
        password = '',
        mnemonicKey = '';
}
