import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class RecieveButton extends StatelessWidget {
  const RecieveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return D3pElevatedButton(text: 'recieve_coins_button_label'.tr());
  }
}
