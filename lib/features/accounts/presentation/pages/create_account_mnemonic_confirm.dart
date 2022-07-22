import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';
import 'package:threedpass/features/accounts/presentation/pages/create_account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/mnemonic_confirm_input.dart';
import 'package:threedpass/features/accounts/presentation/widgets/reset_mnemonic_input.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountMnemonicConfirm extends StatelessWidget {
  const CreateAccountMnemonicConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mnemonic =
        BlocProvider.of<AccountStoreBloc>(context).state.newAccount.mnemonicKey;

    return BlocProvider(
      create: (context) => MnemonicInputCubit(mnemonic),
      child: CreateAccountPageTemplate(
        children: [
          const SizedBox(height: 16),
          Text(
            'backup_confirm_header'.tr(),
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text('backup_confirm_text'.tr()),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerRight,
            child: ResetMnemonicInput(),
          ),
          const MnemonicConfirmInput(),
        ],
        submitButton: BlocBuilder<MnemonicInputCubit, MnemonicInputState>(
          builder: (context, state) => ElevatedButton(
            onPressed: state.words.isEmpty && state.result == mnemonic
                ? () => context.router.push(CreateAccountCredentialsRoute())
                : null,
            child: Text('Next'.tr()),
          ),
        ),
      ),
    );
  }
}
