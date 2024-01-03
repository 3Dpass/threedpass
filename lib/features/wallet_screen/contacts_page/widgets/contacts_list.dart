import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_address_text.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_name_text.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/delete_contact_dialog.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final ContactsState state;

  @override
  Widget build(final BuildContext context) {
    if (state is ContactsCurrentState) {
      final realState = state as ContactsCurrentState;
      final contacts = realState.contacts;

      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (final context, final objIndex) {
          final currentContact = contacts[objIndex];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ContactNameText(name: currentContact.name),
              const Spacer(),
              ContactAddressText(address: currentContact.address),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: IconButton(
                  onPressed: () => _openConfirmDialog(currentContact, context),
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          );
        },
      );
    }
    return const SizedBox();
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
