import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/default_loading_dialog.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview_cubit_provider.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/import_mnemonic_textfield.dart';
import 'package:threedpass/router/router.gr.dart';

class ImportMnemonicForm extends StatelessWidget {
  ImportMnemonicForm({final Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  Future<void> onSubmitPressed({
    required final BuildContext innerContext,
    required final BuildContext outerContext,
    required final AppService appService,
    required final String mnemonicInput,
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
        final accountStoreBloc =
            BlocProvider.of<AccountStoreBloc>(innerContext);
        accountStoreBloc.add(SetMnemonic(input));
        unawaited(
          innerContext.router.push(const CreateAccountCredentialsRoute()),
        );
      } else {
        showTextSnackBar('error_mnemonic_not_found', outerContext);
      }
    } else {
      showTextSnackBar('invalid_input', outerContext);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final AppService appService =
        BlocProvider.of<AppServiceLoaderCubit>(context).state;

    return AddressIconPreviewCubitProvider(
      child: AccountPageTemplate.import(
        onSubmitPressed: (final inner) => onSubmitPressed(
          innerContext: inner,
          outerContext: context,
          appService: appService,
          mnemonicInput: controller.text,
        ),
        needHorizontalPadding: false,
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
                    textEditingController: controller,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}