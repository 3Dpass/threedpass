import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_state.dart';

class ImportAccountCubitProvider extends StatelessWidget {
  const ImportAccountCubitProvider({Key? key, required this.builder})
      : super(key: key);

  final Widget Function({
    required String mnemonic,
    required AppService appService,
    required TextEditingController textEditingController,
  }) builder;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ImportAccountCubit, ImportAccountState>(
        builder: (context, state) {
          final appService = context.read<AppService>();
          final mnemonic = state.accountCreate.mnemonicKey;

          return builder(
            mnemonic: mnemonic,
            appService: appService,
            textEditingController: BlocProvider.of<ImportAccountCubit>(context)
                .textEditingController,
          );
        },
      );
}
