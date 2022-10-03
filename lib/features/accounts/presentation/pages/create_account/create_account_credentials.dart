import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_form.dart';
import 'package:threedpass/router/router.gr.dart';

class CreateAccountCredentials extends StatelessWidget {
  const CreateAccountCredentials({Key? key}) : super(key: key);

  Future<void> _onSubmit({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameCtrl,
    required TextEditingController passCtrl,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      context.router.push(const CreateAccountLoaderRoute());

      final appServiceLoaderCubit =
          BlocProvider.of<AppServiceLoaderCubit>(context);

      final accountStoreBloc = BlocProvider.of<AccountStoreBloc>(context);
      // set acount data
      final account = accountStoreBloc.state.newAccount
          .copyWith(name: nameCtrl.text, password: passCtrl.text);

      final advancedOptions = accountStoreBloc.state.accountAdvancedOptions;

      try {
        final json = await appServiceLoaderCubit.importAccount(
          account: account,
          cryptoType: advancedOptions.type,
          derivePath: advancedOptions.path,
        );

        final keyPairData = await appServiceLoaderCubit.addAccount(
          json: json,
          account: account,
          cryptoType: advancedOptions.type,
          derivePath: advancedOptions.path,
        );

        // apply current account
        appServiceLoaderCubit.changeAccount(keyPairData);
      } catch (e) {
        logger.e(
          'ERROR: Could not create account $e',
        );
        Fluttertoast.showToast(
          msg: 'error_create_account'.tr() + '\n$e',
        );
      }

      accountStoreBloc.add(
        const PopToRoout(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CreateAccountForm(
      onSubmit: _onSubmit,
    );
  }
}
