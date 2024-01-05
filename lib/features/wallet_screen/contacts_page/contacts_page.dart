import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/bloc/contacts_bloc.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/widgets/contacts_list.dart';
import 'package:threedpass/router/router.gr.dart';

@RoutePage()
class ContactsPage extends StatelessWidget {
  const ContactsPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return D3pScaffold(
      appbarTitle: 'contacts_appbar_title',
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (final context, final state) {
          return ContactsList(contacts: state.contacts);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => onTapAddContact(context),
      ),
    );
  }

  void onTapAddContact(final BuildContext context) {
    context.router.push(AddContactRoute());
  }
}
