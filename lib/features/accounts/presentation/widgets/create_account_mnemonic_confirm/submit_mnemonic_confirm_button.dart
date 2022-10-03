import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/bloc/mnemonic_input_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class SubmitMnemonicConfirmButton extends StatelessWidget {
  const SubmitMnemonicConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mnemonic =
        BlocProvider.of<AccountStoreBloc>(context).state.newAccount.mnemonicKey;

    return BlocBuilder<MnemonicInputCubit, MnemonicInputState>(
      builder: (context, state) => D3pElevatedButton(
        onPressed: state.words.isEmpty && state.result == mnemonic
            ? () => context.router.push(const CreateAccountCredentialsRoute())
            : null,
        text: 'Next'.tr(),
      ),
    );
  }
}
