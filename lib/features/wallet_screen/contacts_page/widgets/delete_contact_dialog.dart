import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/text_button.dart';
import 'package:threedpass/core/widgets/dialog/d3p_platform_dialog.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

@RoutePage()
class DeleteContactDialog extends StatelessWidget {
  final Contact contact;

  const DeleteContactDialog({required this.contact, super.key});

  Future<void> deleteContact(final BuildContext context) async {
    BlocProvider.of<ContactsBloc>(context).add(
      DeleteContact(
        contact: contact,
      ),
    );
    unawaited(context.router.pop());
  }

  @override
  Widget build(final BuildContext context) {
    return D3pPlatformDialog(
      title: 'delete_contact_confirm_title'.tr(args: [contact.name]),
      content: Text(
        'delete_contact_confirm_text'.tr(
            args: [contact.name, Formatters.shorterAddress(contact.address)]),
      ),
      actions: [
        D3pTextButton(
          text: 'Cancel'.tr(),
          onPressed: () => context.router.pop(),
        ),
        D3pTextButton(
          text: 'Delete'.tr(),
          onPressed: () => deleteContact(context),
        ),
      ],
    );
  }
}
