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
    this.iconAlignment = IconAlignment.start,
    this.flexibleText = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final double? height;
  final String text;
  final Color? textColor;
  final double? width;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;
  final IconAlignment iconAlignment;
  final bool flexibleText;

  @override
  Widget build(final BuildContext context) {
    final textWidget = Text(
      text,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textColor != null
          ? Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)
          : null,
    );
    final flexedText = flexibleText ? Flexible(child: textWidget) : textWidget;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(icon),
          ),
        flexedText,
      ],
    );
    // return textWidget;
    return SizedBox(
      height: height,
      width: width,
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoButton(
              onPressed: onPressed,
              child: child, // TODO set iconAlignment
            )
          : icon != null
              ? TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(icon),
                  label: flexedText,
                  iconAlignment: iconAlignment,
                )
              : TextButton(
                  onPressed: onPressed,
                  child: child,
                ),
    );
  }
}
