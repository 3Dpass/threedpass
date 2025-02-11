import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';
import 'package:threedpass/features/wallet_screen/contacts_page/utils/open_contacts_picker.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';

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
      controller: toAddressController,
      hintText: 'to_address_hint'.tr(),
      labelText: 'to_address_label'.tr(),
      maxLines: 1,
      onSuffixButtonPressed: () => openContactsPicker(
        context: context,
        textFieldKey: textFieldKey,
        onPicked: (final Contact contact) =>
            toAddressController.text = contact.address,
      ),
      suffixButton: Icons.person,
    );
  }
}
