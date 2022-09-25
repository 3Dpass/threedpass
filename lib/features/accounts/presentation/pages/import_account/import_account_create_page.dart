import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/domain/account_create.dart';
import 'package:threedpass/features/accounts/presentation/widgets/create_account_form.dart';

class ImportAccountCreatePage extends StatelessWidget {
  const ImportAccountCreatePage({Key? key}) : super(key: key);

  Future<void> _onSubmit({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameCtrl,
    required TextEditingController passCtrl,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      // context.router.push(const CreateAccountLoaderRoute());

      DefaultLoadingDialog.show(context);

      final appServiceLoaderCubit =
          BlocProvider.of<AppServiceLoaderCubit>(context);

      final importAccountCubit = BlocProvider.of<ImportAccountCubit>(context);

      final account = importAccountCubit.state.accountCreate.copyWith(
        name: nameCtrl.text,
        password: passCtrl.text,
      );

      try {
        final accJson = await appServiceLoaderCubit.importAccount(
          account: account,
        );
        DefaultLoadingDialog.hide(context);

        final duplicated = _checkAccountDuplicate(
          context,
          appServiceLoaderCubit.state,
          accJson['pubKey'],
        );

        if (!duplicated) {
          final keyPairData = await appServiceLoaderCubit.addAccount(
            json: accJson,
            account: account,
          );

          // apply current account
          appServiceLoaderCubit.changeAccount(keyPairData);
        } else {
          showTextSnackBar('error_import_duplicate', context);
        }
      } catch (_) {
        // account was not imported
        showTextSnackBar('error_import_invalid', context);
      }

      importAccountCubit.popToRoot();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CreateAccountForm(onSubmit: _onSubmit);
  }

  static bool _checkAccountDuplicate(
    BuildContext context,
    AppService service,
    String pubKey,
  ) {
    final index =
        service.keyring.keyPairs.indexWhere((i) => i.pubKey == pubKey);

    return index > -1;
  }
}
