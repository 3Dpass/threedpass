import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class D3pTextButton extends StatelessWidget {
  const D3pTextButton({
    required this.text,
    final Key? key,
    this.width,
    this.height,
    this.onPressed,
    this.textColor,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  final void Function()? onPressed;
  final double? height;
  final String text;
  final Color? textColor;
  final double? width;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(final BuildContext context) {
    final textWidget = Text(
      text,
      style: textColor != null
          ? Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)
          : null,
    );
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon),
          ),
        textWidget,
      ],
    );
    return SizedBox(
      height: height,
      width: width,
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoButton(
              onPressed: onPressed,
              child: child,
            )
          : icon != null
              ? TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(icon),
                  label: textWidget,
                )
              : TextButton(
                  onPressed: onPressed,
                  child: child,
                ),
    );
  }
}
