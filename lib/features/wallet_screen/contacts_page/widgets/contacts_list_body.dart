import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contacts_list.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/no_contacts_text.dart';

class ContactsListBody extends StatelessWidget {
  const ContactsListBody({required this.contacts, super.key});

  final List<Contact> contacts;

  @override
  Widget build(final BuildContext context) {
    if (contacts.isEmpty) {
      return const NoContactsText();
    } else {
      return ContactsList(
        contacts: contacts,
      );
    }
  }
}
