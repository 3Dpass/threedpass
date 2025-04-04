import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:threedpass/setup.dart';

void openContactsPicker({
  required final BuildContext context,
  required final GlobalKey textFieldKey,
  required final void Function(Contact) onPicked,
}) {
  final RenderBox renderBox =
      textFieldKey.currentContext!.findRenderObject()! as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);
  final ContactsRepository contactsRepository = getIt<ContactsRepository>();
  final List<Contact> contacts = contactsRepository.getAll();

  if (contacts.isNotEmpty) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + (renderBox.size.height + 5),
        offset.dx,
        offset.dy,
      ),
      items: contacts.map((final Contact contact) {
        return PopupMenuItem<Contact>(
          value: contact,
          child: Text(
            contact.name + ": " + Formatters.shorterAddress(contact.address),
          ),
        );
      }).toList(),
    ).then((final Contact? contact) {
      if (contact != null) {
        onPicked(contact);
      }
    });
  } else {
    context.router.push(
      NotificationDialogRoute(
        title: 'no_contacts_notification_dialog_title'.tr(),
        message: 'no_contacts_notification_dialog_content'.tr(),
      ),
    );
  }
}
