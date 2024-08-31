import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';

class AccountStoreBlocBuilder extends StatelessWidget {
  const AccountStoreBlocBuilder({
    required this.builder,
    final Key? key,
  }) : super(key: key);

  final Widget Function({
    required String mnemonic,
  }) builder;

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<AccountStoreBloc, AccountStoreState>(
        builder: (final context, final state) {
          final mnemonic = state.newAccount.mnemonicKey;

          return builder(
            mnemonic: mnemonic,
          );
        },
      );
}
