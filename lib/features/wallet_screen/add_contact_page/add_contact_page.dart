import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:threedpass/core/polkawallet/app_service.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/show_text_snackbar.dart';
import 'package:threedpass/core/widgets/buttons/card_elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

@RoutePage()
class AddContactPage extends StatelessWidget {
  AddContactPage({final Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late final AppService appService;
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController addressTextController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return D3pScaffold(
      appbarTitle: 'add_contact_appbar_title',
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      child: D3pTextFormField(
                        labelText: 'contact_name'.tr(),
                        hintText: 'contact_name_hint'.tr(),
                        controller: nameTextController,
                        validator: _validateInputName,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: D3pTextFormField(
                        labelText: 'contact_address'.tr(),
                        hintText: 'contact_address_hint'.tr(),
                        controller: addressTextController,
                        validator: _validateInputAddress,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBoxH16(),
              D3pCardElevatedButton(
                text: 'add_contact'.tr(),
                onPressed: () => onTapAddContact(context),
                iconData: Icons.add,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onTapAddContact(final BuildContext context) async {
    final bool isCorrect =
        await checkAddressAndNotify(addressTextController.text);
    if (isCorrect) {
      // Check user input
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        final newContact = Contact(
            name: nameTextController.text, address: addressTextController.text);
        final contactsBox = Hive.box<Contact>('contacts');
        final bool contactExists =
            contactsBox.values.any((final contact) => contact == newContact);
        if (!contactExists) {
          BlocProvider.of<ContactsBloc>(context).add(
            AddContact(
              contact: newContact,
            ),
          );
          await context.router.pop();
        } else {
          FastSnackBar(
            textCode: 'contact_name_exists',
            context: context,
          ).show();
        }
      } else {
        FastSnackBar(
          textCode: 'invalid_input',
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

  Future<bool> checkAddressAndNotify(final String toAddress) async {
    final addressCorrect =
        await appService.plugin.sdk.api.account.checkAddressFormat(
      toAddress,
      appService.networkStateData.ss58Format!,
    );

    if (addressCorrect == null) {
      unawaited(Fluttertoast.showToast(msg: 'could_not_check_address'.tr()));
      return false;
    }

    if (!addressCorrect) {
      unawaited(Fluttertoast.showToast(msg: 'wrong_address'.tr()));
      return false;
    }

    return true;
  }
}
