import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/buttons/card_elevated_button.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/core/widgets/paddings.dart';
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
          if (state is ContactsCurrentState) {
            return _buildContactsCurrentState(context, state);
          } else {
            return Center(
              child: PlatformCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildContactsCurrentState(
    final BuildContext context,
    final ContactsCurrentState state,
  ) {
    Widget contactsWidget;
    if (state.contacts.isEmpty) {
      contactsWidget = Center(
        child: Text(
          'no_contacts'.tr(),
        ),
      );
    } else {
      contactsWidget = Flexible(
        child: ContactsList(
          state: state,
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            contactsWidget,
            const SizedBoxH16(),
            D3pCardElevatedButton(
              text: 'new_contact'.tr(),
              onPressed: () => onTapAddContact(context),
              iconData: Icons.add,
            ),
          ],
        ),
      ),
    );
  }

  void onTapAddContact(final BuildContext context) {
    context.router.push(AddContactRoute());
  }
}
