import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/core/widgets/input/textformfield.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/import_account_cubit_builder.dart';
import 'package:threedpass/router/router.gr.dart';

class ImportMnemonicForm extends StatelessWidget {
  ImportMnemonicForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  /// https://github.com/polkawallet-io/app/blob/48821c58b19b2e6df17200bc0c5d10bf5577ac41/lib/pages/account/import/importAccountFormMnemonic.dart#L140
  static String? _validateInput(String? v) {
    bool passed = false;
    if (v != null) {
      String input = v.trim();
      int len = input.split(' ').length;
      if (len >= 12) {
        passed = true;
      }
    }
    return passed ? null : 'Invalid'.tr() + ' ' + 'import_type_mnemonic'.tr();
  }

  Future<void> onSubmitPressed({
    required BuildContext innerContext,
    required BuildContext outerContext,
    required AppService appService,
    required String mnemonicInput,
  }) async {
    // Check user input
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Api call to check mnemonic
      DefaultLoadingDialog.show(outerContext);
      final input = mnemonicInput.trim();
      final res =
          await appService.plugin.sdk.api.keyring.checkMnemonicValid(input);
      DefaultLoadingDialog.hide(outerContext);

      if (res) {
        BlocProvider.of<ImportAccountCubit>(innerContext).setMnemonic(input);
        innerContext.router.push(const ImportAccountCreateRoute());
      } else {
        showTextSnackBar('error_mnemonic_not_found', outerContext);
      }
    } else {
      showTextSnackBar('invalid_input', outerContext);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImportAccountCubitBuilder(
      // ignore: prefer-extracting-callbacks
      builder: ({
        required String mnemonic,
        required AppService appService,
        required TextEditingController textEditingController,
      }) {
        return AccountPageTemplate.import(
          children: [
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: D3pTextFormField(
                    labelText: 'import_type_mnemonic'.tr(),
                    hintText: 'import_mnemonic_hint'.tr(),
                    controller: textEditingController,
                    validator: _validateInput,
                  ),
                ),
              ],
            ),
          ],
          onSubmitPressed: (inner) => onSubmitPressed(
            innerContext: inner,
            outerContext: context,
            appService: appService,
            mnemonicInput: textEditingController.text,
          ),
        );
      },
    );
  }
}
