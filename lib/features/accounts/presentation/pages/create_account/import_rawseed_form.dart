import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/accounts/bloc/account_store_bloc/account_store_bloc.dart';
import 'package:threedpass/features/accounts/domain/rawseed_text.dart';
import 'package:threedpass/features/accounts/presentation/pages/account_page_template.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_mnemonic_form/address_icon_preview_cubit_provider.dart';
import 'package:threedpass/features/accounts/presentation/widgets/import_rawseed_form/import_rawseed_textfield.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class ImportRawseedFormPage extends StatelessWidget {
  ImportRawseedFormPage({final Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  Future<void> onSubmitPressed({
    required final BuildContext innerContext,
    required final BuildContext outerContext,
    required final AppService appService,
    required final String rawseedInput,
  }) async {
    // Check user input
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final input = rawseedInput.trim().toLowerCase();
      final accountStoreBloc = BlocProvider.of<AccountStoreBloc>(innerContext);
      final rawseedObj = RawseedText(input);
      accountStoreBloc.add(SetRawseed(rawseedObj));
      unawaited(
        innerContext.router.push(
          CreateAccountCredentialsRoute(
            appbarText: AccountAppbarTitle.import,
          ),
        ),
      );
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
          rawseedInput: controller.text,
        ),
        needHorizontalPadding: false,
        children: [
          const AddressIconPreview(
            placeholderText: 'import_rawseed_preview_placeholder',
          ),
          const SizedBoxH16(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: ImportRawseedTextfield(
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
