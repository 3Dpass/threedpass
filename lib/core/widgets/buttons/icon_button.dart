import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO make async variation with loader
class D3pIconButton extends StatelessWidget {
  const D3pIconButton({
    this.iconData,
    this.padding,
    this.onPressed,
    this.iconColor,
    this.size,
    this.splashRadius,
    this.emptyContraints = false,
    // this.text,
    this.cupertinoIcon,
    this.iconWidget,
    super.key,
  }) : assert(
          iconData != null || iconWidget != null,
          'Either iconData or iconWidget must be provided',
        );

  const D3pIconButton.fake({
    super.key,
  })  : iconData = Icons.abc,
        size = null,
        iconWidget = null,
        iconColor = Colors.transparent,
        emptyContraints = false,
        splashRadius = null,
        padding = EdgeInsets.zero,
        cupertinoIcon = null,
        onPressed = null;

  final IconData? iconData;
  final Color? iconColor;
  final void Function()? onPressed;
  final double? size;
  final bool emptyContraints;
  final double? splashRadius;
  final EdgeInsets? padding;
  final IconData? cupertinoIcon;
  final Widget? iconWidget;

  @override
  Widget build(final BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoButton(
        padding: padding,
        onPressed: onPressed,
        child: iconWidget ??
            Icon(
              cupertinoIcon ?? iconData,
              size: size,
              color: iconColor,
            ),
      );
    } else {
      return IconButton(
        padding: padding,
        onPressed: onPressed,
        icon: iconWidget ??
            Icon(
              iconData,
              size: size,
              color: iconColor,
            ),
        constraints: emptyContraints ? const BoxConstraints() : null,
        splashRadius: splashRadius,
      );
    }
  }
}
