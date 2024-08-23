import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/account_store_bloc_builder.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/mnemonic_backup_content.dart';

@RoutePage()
class CreateAccountMnemonicBackupPage extends StatelessWidget {
  const CreateAccountMnemonicBackupPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    // Listen to accountStoreChanges
    return AccountStoreBlocBuilder(
      // ignore: prefer-extracting-callbacks
      builder: ({
        required final String mnemonic,
      }) {
        // Provide advanced options form
        return D3pScaffold(
          appBarTitle: 'create_account_title',
          body: MnemonicBackupContent(
            mnemonic: mnemonic,
          ),
        );
      },
    );
  }
}
