import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RecieveButton extends StatelessWidget {
  const RecieveButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    context.router.push(const RecieveRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return FastCardButton(
      title: 'Recieve',
      iconData: Icons.qr_code_2_rounded,
      onButtonPressed: () => onPressed(context),
    );
  }
}
