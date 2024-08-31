import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

@RoutePage()
class AddContactPage extends StatelessWidget {
  AddContactPage({final Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appBarTitle: 'add_contact_appbar_title',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  D3pTextFormField(
                    labelText: 'contact_name'.tr(),
                    hintText: 'contact_name_hint'.tr(),
                    controller: nameTextController,
                    validator: _validateInputName,
                  ),
                  const H16(),
                  D3pTextFormField(
                    labelText: 'contact_address'.tr(),
                    hintText: 'contact_address_hint'.tr(),
                    controller: addressTextController,
                    validator: _validateInputAddress,
                  ),
                ],
              ),
            ),
            const H16(),
            D3pElevatedButton(
              text: 'add_contact'.tr(),
              onPressed: () => onTapAddContact(context),
              iconData: Icons.add,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onTapAddContact(final BuildContext context) async {
    // Check user input
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final address = addressTextController.text.trim();
      final bool isCorrect =
          await BlocProvider.of<AppServiceLoaderCubit>(context)
              .checkAddressAndNotify(address);
      if (isCorrect) {
        final newContact = Contact(
          name: nameTextController.text,
          address: address,
        );
        final bool isContactExisting = BlocProvider.of<ContactsBloc>(context)
            .isContactExisting(newContact);
        if (!isContactExisting) {
          BlocProvider.of<ContactsBloc>(context).add(
            AddContact(
              contact: newContact,
            ),
          );
          unawaited(context.router.pop());
        } else {
          FastSnackBar(
            textCode: 'contact_name_exists',
            context: context,
          ).show();
        }
      } else {
        FastSnackBar(
          textCode: 'bad_address',
          context: context,
        ).show();
      }
    }
  }

  static String? _validateInputName(final String? v) {
    bool passed = false;
    if (v != null && v.isNotEmpty) {
      passed = true;
    }
    return passed ? null : 'Invalid'.tr() + ' ' + 'contact_name'.tr();
  }

  String? _validateInputAddress(final String? v) {
    bool passed = false;
    if (v != null && v.isNotEmpty) {
      passed = true;
    }
    return passed ? null : 'Invalid'.tr() + ' ' + 'contact_address'.tr();
  }
}
