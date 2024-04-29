import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class D3pSecondaryButton extends StatelessWidget {
  final IconData? iconData;
  final String localizedTextKey;
  final VoidCallback? onPressed;

  const D3pSecondaryButton({
    required this.localizedTextKey,
    this.iconData,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
        side: MaterialStateProperty.resolveWith(
          (final states) {
            if (!states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: D3pThemeData.mainColor,
              );
            } else {
              return null;
            }
          },
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(width: 8),
          Text(localizedTextKey.tr()),
        ],
      ),
    );
  }
}
