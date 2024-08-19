import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/buttons/clickable_card.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/router/router.gr.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    required this.contacts,
    super.key,
  });

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
                Text(currentContact.name),
                const Spacer(),
                Text(Fmt.shorterAddress(currentContact.address)),
                const SizedBox(width: 8),
                D3pIconButton(
                  onPressed: () => context.router
                      .push(DeleteContactRoute(contact: currentContact)),
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
}
