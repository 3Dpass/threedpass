import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/mnemonic_text_field.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountMnemonicBackup extends StatelessWidget {
  const CreateAccountMnemonicBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountStoreBloc, AccountStoreState>(
      builder: (context, state) {
        final mnemonic = state.newAccount.mnemonicKey;

        return CreateAccountPageTemplate(
          children: [
            const SizedBox(height: 16),
            Text(
              'backup_warn1_header'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('backup_warn1_text'.tr()),
            const SizedBox(height: 12),
            MnemonicTextField(text: mnemonic),
          ],
          onSubmitPressed: () => context.router.push(
            const MnemonicConfirmRoute(),
          ),
        );
      },
    );
  }
}
