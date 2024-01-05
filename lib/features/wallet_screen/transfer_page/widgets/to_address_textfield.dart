import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/repositories/contacts_repository.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';
import 'package:threedpass/setup.dart';

class ToAddressTextField extends StatelessWidget {
  ToAddressTextField({
    required this.toAddressController,
    final Key? key,
  }) : super(key: key);

  final GlobalKey textFieldKey = GlobalKey();
  final TextEditingController toAddressController;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      key: textFieldKey,
      labelText: 'to_address_label'.tr(),
      controller: toAddressController,
      maxLines: 1,
      hintText: 'to_address_hint'.tr(),
      suffixButton: Icons.person,
      onSuffixButtonPressed: () => _onSuffixButtonPressed(context),
    );
  }

  void _onSuffixButtonPressed(final BuildContext context) {
    final RenderBox renderBox =
        textFieldKey.currentContext!.findRenderObject()! as RenderBox;
    final Offset offset = renderBox!.localToGlobal(Offset.zero);
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
              contact.name + ": " + Fmt.shorterAddress(contact.address),
            ),
          );
        }).toList(),
      ).then((final Contact? contact) {
        if (contact != null) {
          toAddressController.text = contact.address;
        }
      });
    }
  }
}
