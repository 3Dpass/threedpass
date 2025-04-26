import 'package:flutter/material.dart';
import 'package:threedpass/features/other/card_with_buttons/card_button.dart';

class FastCardButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isLoading;
  final VoidCallback? onButtonPressed;

  const FastCardButton({
    required this.iconData,
    required this.title,
    this.isLoading = false,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) => CardButton(
        icon: Icon(iconData),
        title: title,
        isLoading: isLoading,
        onButtonPressed: onButtonPressed,
        badge: null,
      );
}
