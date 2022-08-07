import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/features/accounts/domain/account_advanced_options.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';

part 'import_account_state.g.dart';

@CopyWith()
class ImportAccountState {
  const ImportAccountState({
    required this.accountCreate,
    required this.importType,
    required this.accountAdvancedOptions,
  });

  ImportAccountState.initial()
      : accountCreate = const AccountCreate.intial(),
        accountAdvancedOptions = const AccountAdvancedOptions.defaultValues(),
        importType = ImportType.mnemonic;

  final AccountAdvancedOptions accountAdvancedOptions;
  final AccountCreate accountCreate;
  final ImportType importType;
}

enum ImportType {
  mnemonic,
  rawSeed,
  keystore,
}
