import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc.dart';

class MnemonicProvider extends StatelessWidget {
  const MnemonicProvider({Key? key, required this.builder}) : super(key: key);

  final Widget Function({
    required String mnemonic,
    required AppService appService,
  }) builder;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AccountStoreBloc, AccountStoreState>(
        builder: (context, state) {
          final appService = context.read<AppService>();
          final mnemonic = state.newAccount.mnemonicKey;

          return builder(
            mnemonic: mnemonic,
            appService: appService,
          );
        },
      );
}
