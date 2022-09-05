import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class TransferButton extends StatelessWidget {
  const TransferButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D3pElevatedButton(text: 'transfer_coins_button_label'.tr());
  }
}
