import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
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

  bool get isDisabled => onPressed == null;

  @override
  Widget build(final BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        foregroundColor: D3pThemeData.mainColor,
        disabledForegroundColor: D3pColors.disabled,
        side: BorderSide(
          color: isDisabled ? D3pColors.disabled : D3pThemeData.mainColor,
          width: 2.28,
        ),
        textStyle: Theme.of(context).customTextStyles.d3pFloatingButton,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) Icon(iconData),
          if (iconData != null) const SizedBox(width: 8),
          Text(localizedTextKey.tr()),
        ],
      ),
    );
  }
}
