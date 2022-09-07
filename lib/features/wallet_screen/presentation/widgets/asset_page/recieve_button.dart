import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RecieveButton extends StatelessWidget {
  const RecieveButton({Key? key}) : super(key: key);

  void onPressed(BuildContext context) {
    context.router.push(const RecieveRoute());
  }

  @override
  Widget build(BuildContext context) {
    return D3pElevatedButton(
      text: 'recieve_coins_button_label'.tr(),
      onPressed: () => onPressed(context),
    );
  }
}
