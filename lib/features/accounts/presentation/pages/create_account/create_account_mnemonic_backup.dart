import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/widgets/appbars/common_string_appbar.dart';
import 'package:threedpass/features/accounts/presentation/widgets/advanced_options/advanced_options_form_bloc_provider.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/account_store_bloc_builder.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/mnemonic_backup_advanced_options_listener.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_backup/mnemonic_backup_content.dart';

class CreateAccountMnemonicBackup extends StatelessWidget {
  const CreateAccountMnemonicBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to accountStoreChanges
    return AccountStoreBlocBuilder(
      // ignore: prefer-extracting-callbacks
      builder: ({required String mnemonic, required AppService appService}) {
        // Provide advanced options form
        return AdvancedOptionsFormBlocProvider(
          appService: appService,
          mnemonic: mnemonic,
          child: Scaffold(
            appBar: CommonStringAppbar(title: 'create_account_title'.tr()),
            // listen and react to  advanced options form changes
            body: MnemonicBackupAdvancedOptionsListener(
              appService: appService,
              // Show mnemonic and change options
              child: MnemonicBackupContent(
                mnemonic: mnemonic,
              ),
            ),
          ),
        );
      },
    );
  }
}
