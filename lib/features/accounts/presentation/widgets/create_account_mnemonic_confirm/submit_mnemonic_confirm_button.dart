import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/router/router.gr.dart';

class SubmitMnemonicConfirmButton extends StatelessWidget {
  const SubmitMnemonicConfirmButton({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final mnemonic =
        BlocProvider.of<AccountStoreBloc>(context).state.newAccount.mnemonicKey;

    return BlocBuilder<MnemonicInputCubit, MnemonicInputState>(
      builder: (final context, final state) => D3pElevatedButton(
        onPressed: state.words.isEmpty && state.result == mnemonic
            ? () async => context.router.push(
                  CreateAccountCredentialsRoute(
                    appbarText: AccountAppbarTitle.create,
                  ),
                )
            : null,
        text: 'Next'.tr(),
      ),
    );
  }
}
