import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/appbars/common_string_appbar.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/account_store_bloc_builder.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/mnemonic_backup_content.dart';

class CreateAccountMnemonicBackup extends StatelessWidget {
  const CreateAccountMnemonicBackup({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    // Listen to accountStoreChanges
    return AccountStoreBlocBuilder(
      // ignore: prefer-extracting-callbacks
      builder: ({
        required final String mnemonic,
        required final AppService appService,
      }) {
        // Provide advanced options form
        return D3pScaffold(
          appbarTitle: 'create_account_title',
          // listen and react to  advanced options form changes
          body: MnemonicBackupContent(
            mnemonic: mnemonic,
          ),
        );
      },
    );
  }
}
