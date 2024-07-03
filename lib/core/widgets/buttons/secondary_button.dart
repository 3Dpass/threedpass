import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
