import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_address_text.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contact_name_text.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    required this.state,
    final Key? key,
  }) : super(key: key);

  final ContactsState state;

  @override
  Widget build(final BuildContext context) {
    if (state is ContactsLoaded) {
      final realState = state as ContactsLoaded;
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
                  onPressed: () => _deleteContact(objIndex, realState, context),
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

  void _deleteContact(
    final int index,
    final ContactsLoaded state,
    final BuildContext context,
  ) {
    BlocProvider.of<ContactsBloc>(context).add(
      DeleteContact(
        contact: state.contacts[index],
      ),
    );
    state.contacts.removeAt(index);
  }
}
