import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/advanced_options/advanced_options_form_bloc_provider.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/import_account_cubit_provider.dart';

class ImportMnemonicForm extends StatelessWidget {
  const ImportMnemonicForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountPageTemplate.import(
      children: [
        ImportAccountCubitProvider(
          // ignore: prefer-extracting-callbacks
          builder: ({
            required String mnemonic,
            required AppService appService,
          }) {
            return AdvancedOptionsFormBlocProvider(
              appService: appService,
              mnemonic: mnemonic,
              child: SizedBox(),
            );
          },
        ),
      ],
      disableBottomButton: true,
      // onSubmitPressed: ,
    );
  }
}
