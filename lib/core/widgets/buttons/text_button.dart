import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO Create button with loader for async actions
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
      style: textColor != null
          ? Theme.of(context).textTheme.labelLarge!.copyWith(color: textColor)
          : null,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
    final flexedText = flexibleText ? Flexible(child: textWidget) : textWidget;

    final child = Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Padding(padding: const EdgeInsets.only(right: 8), child: Icon(icon)),
        flexedText,
      ],
    );

    return SizedBox(
      width: width,
      height: height,
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoButton(child: child, onPressed: onPressed)
          : icon != null
              ? TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(icon),
                  label: flexedText,
                  iconAlignment: iconAlignment,
                )
              : TextButton(onPressed: onPressed, child: child),
    );
  }
}
