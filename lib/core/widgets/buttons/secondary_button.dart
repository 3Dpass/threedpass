import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme_data.dart';

class D3pSecondaryButton extends StatelessWidget {
  final IconData? iconData;
  final String localizedTextKey;
  final VoidCallback? onPressed;
  final bool isInfinityWidth;
  final bool translate;
  final Color? color;

  const D3pSecondaryButton({
    required this.localizedTextKey,
    this.iconData,
    this.onPressed,
    this.isInfinityWidth = true,
    this.translate = true,
    this.color,
    super.key,
  });

  String get textToShow => translate ? localizedTextKey.tr() : localizedTextKey;

  @override
  Widget build(final BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: isInfinityWidth
            ? const Size.fromHeight(D3pThemeData.buttonHeight)
            : null,
        foregroundColor: color,
        side: color != null ? BorderSide(color: color!) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) Icon(iconData),
          if (iconData != null) const SizedBox(width: 8),
          Text(textToShow),
        ],
      ),
    );
  }
}
