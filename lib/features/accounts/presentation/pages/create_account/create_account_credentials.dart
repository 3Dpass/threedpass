import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:polkawallet_sdk/api/apiKeyring.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/features/accounts/domain/account_info.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_form.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart';

class CreateAccountCredentials extends StatelessWidget {
  const CreateAccountCredentials({required this.appbarText, final Key? key})
      : super(key: key);

  final String appbarText;

  // TODO refactor. Move logit out of UI
  Future<void> _onSubmit({
    required final BuildContext context,
    required final GlobalKey<FormState> formKey,
    required final TextEditingController nameCtrl,
    required final TextEditingController passCtrl,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      unawaited(context.router.push(const CreateAccountLoaderRoute()));

      final appServiceLoaderCubit =
          BlocProvider.of<AppServiceLoaderCubit>(context);
      final accountStoreBloc = BlocProvider.of<AccountStoreBloc>(context);

      // set acount data
      final account = accountStoreBloc.state.newAccount
          .copyWithTyped(name: nameCtrl.text, password: passCtrl.text);

      final advancedOptions = accountStoreBloc.state.accountAdvancedOptions;

      final keyType = accountStoreBloc.state.newAccount is AccountCreateMnemonic
          ? KeyType.mnemonic
          : KeyType.rawSeed;

      try {
        await FullAccountContext(
          account: account,
          keyType: keyType,
          advancedOptions: advancedOptions,
        ).createAccount(
          appServiceLoaderCubit,
          () {
            FastSnackBar(
              textCode: 'error_import_duplicate',
              context: context,
            ).show();
          },
        );
      } on Exception catch (e) {
        getIt<Logger>().e(
          'ERROR: Could not create account $e',
        );

        unawaited(
          Fluttertoast.showToast(
            msg: 'error_create_account'.tr() + '\n$e',
          ),
        );
      }

      accountStoreBloc.add(const PopToRoout());
    }
  }

  @override
  Widget build(final BuildContext context) {
    return CreateAccountForm(
      appbarText: appbarText,
      onSubmit: _onSubmit,
    );
  }
}
