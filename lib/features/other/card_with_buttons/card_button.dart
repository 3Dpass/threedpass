import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_button_data.dart';

class CardButton extends StatelessWidget {
  final CardButtonData data;

  static const double size = 90;

  const CardButton({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: TextButton(
        onPressed: data.onButtonPressed,
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelSmall,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: data.icon,
      ),
    );
  }
}
