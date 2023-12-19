import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/widgets/basic_transfer_textfield.dart';

class ToAddressTextField extends StatelessWidget {
  const ToAddressTextField({
    required this.toAddressController,
    final Key? key,
  }) : super(key: key);

  final TextEditingController toAddressController;

  @override
  Widget build(final BuildContext context) {
    return BasicTransferTextField(
      labelText: 'to_address_label'.tr(),
      controller: toAddressController,
      maxLines: 1,
      hintText: 'to_address_hint'.tr(),
    );
  }
}
