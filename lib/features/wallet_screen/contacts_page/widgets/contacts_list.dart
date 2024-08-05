import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_address_text.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_name_text.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/delete_contact_dialog.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    required this.contacts,
    final Key? key,
  }) : super(key: key);

  final List<Contact> contacts;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contacts.length,
      separatorBuilder: (final context, final index) => const H8(),
      itemBuilder: (final context, final objIndex) {
        final currentContact = contacts[objIndex];
        return D3pCard(
          child: Padding(
            padding: ClickableCard.buttonPaddingPreset,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContactNameText(name: currentContact.name),
                const Spacer(),
                ContactAddressText(address: currentContact.address),
                const SizedBox(width: 8),
                D3pIconButton(
                  onPressed: () => _openConfirmDialog(currentContact, context),
                  iconData: Icons.delete,
                  emptyContraints: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openConfirmDialog(
    final Contact currentContact,
    final BuildContext context,
  ) {
    showPlatformDialog<void>(
      context: context,
      builder: (final BuildContext context) {
        return DeleteContactDialog(contact: currentContact);
      },
    );
  }
}
