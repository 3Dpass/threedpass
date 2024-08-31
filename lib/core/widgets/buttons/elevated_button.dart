import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    required this.text,
    final Key? key,
    this.onPressed,
    this.iconData,
    this.child,
    this.isInfinityWidth = true,
  }) : super(key: key);

  final void Function()? onPressed;
  final String? text;
  final IconData? iconData;
  final Widget? child;
  final bool isInfinityWidth;

  @override
  Widget build(final BuildContext context) {
    final realChild = child ??
        _ElevatedButtonChild(
          iconData: iconData,
          text: text ?? '',
        );
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoButton.filled(onPressed: onPressed, child: realChild);
    } else {
      return FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: isInfinityWidth
              ? MaterialStateProperty.all(
                  const Size.fromHeight(D3pThemeData.buttonHeight),
                )
              : null,
        ),
        child: realChild,
      );
    }
  }
}

class _ElevatedButtonChild extends StatelessWidget {
  const _ElevatedButtonChild({
    required this.iconData,
    required this.text,
  });

  final String text;
  final IconData? iconData;

  double get padding => text.isEmpty ? 0 : 8;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconData != null)
          Padding(
            padding: EdgeInsets.only(right: padding),
            child: Icon(iconData),
          ),
        if (text.isNotEmpty)
          Text(
            text,
          ),
      ],
    );
  }
}
