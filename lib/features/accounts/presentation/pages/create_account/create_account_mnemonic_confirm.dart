import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_confirm/mnemonic_confirm_input.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_confirm/reset_mnemonic_input.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_mnemonic_confirm/submit_mnemonic_confirm_button.dart';

@RoutePage()
class CreateAccountMnemonicConfirmPage extends StatelessWidget {
  const CreateAccountMnemonicConfirmPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final mnemonic =
        BlocProvider.of<AccountStoreBloc>(context).state.newAccount.mnemonicKey;

    return BlocProvider(
      create: (final context) => MnemonicInputCubit(mnemonic),
      child: AccountPageTemplate.create(
        children: [
          const H16(),
          Text(
            'backup_confirm_header'.tr(),
            style: Theme.of(context)
                .customTextStyles
                .d3ptitleLarge
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const H16(),
          const D3pBodyMediumText('backup_confirm_text'),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerRight,
            child: ResetMnemonicInput(),
          ),
          const MnemonicConfirmInput(),
        ],
        submitButton: const SizedBox(
          width: double.infinity,
          child: SubmitMnemonicConfirmButton(),
        ),
      ),
    );
  }
}
