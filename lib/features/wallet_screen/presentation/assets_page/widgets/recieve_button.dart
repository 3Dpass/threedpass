import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/floating_action_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RecieveButton extends StatelessWidget {
  const RecieveButton({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    context.router.push(const RecieveRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return D3pFloatingActionButton(
      heroTag: 'recieve_coins_button_label',
      text: 'recieve_coins_button_label',
      icons: Icons.arrow_downward_rounded,
      onPressed: () => onPressed(context),
    );
  }
}
