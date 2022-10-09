import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/import_account_cubit/import_account_cubit.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview_cubit_provider.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/import_account_cubit_builder.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/import_mnemonic_textfield.dart';
import 'package:threedpass/router/router.gr.dart';

class ImportMnemonicForm extends StatelessWidget {
  ImportMnemonicForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
        return AddressIconPreviewCubitProvider(
          child: AccountPageTemplate.import(
            children: [
              const AddressIconPreview(),
              const SizedBox(height: 16),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: ImportMnemonicTextfield(
                        textEditingController: textEditingController,
                      ),
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
            needHorizontalPadding: false,
          ),
        );
      },
    );
  }
}
