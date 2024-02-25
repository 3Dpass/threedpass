import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pIconButton extends StatelessWidget {
  const D3pIconButton({
    required this.iconData,
    this.padding,
    this.onPressed,
    this.iconColor,
    this.size,
    this.splashRadius,
    this.emptyContraints = false,
    this.text,
    this.cupertinoIcon,
    super.key,
  });

  const D3pIconButton.fake({
    super.key,
  })  : iconData = Icons.abc,
        size = null,
        text = null,
        iconColor = Colors.transparent,
        emptyContraints = false,
        splashRadius = null,
        padding = EdgeInsets.zero,
        cupertinoIcon = null,
        onPressed = null;

  final IconData iconData;
  final Color? iconColor;
  final void Function()? onPressed;
  final double? size;
  final bool emptyContraints;
  final double? splashRadius;
  final String? text;
  final EdgeInsets? padding;
  final IconData? cupertinoIcon;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlatformIconButton(
          icon: Icon(
            iconData,
            size: size,
            color: iconColor,
          ),
          cupertinoIcon: cupertinoIcon != null
              ? Icon(
                  cupertinoIcon,
                  size: size,
                  color: iconColor,
                )
              : null,
          onPressed: onPressed,
          material: (final _, final __) => MaterialIconButtonData(
            padding: padding ?? EdgeInsets.zero,
            constraints: emptyContraints ? const BoxConstraints() : null,
            splashRadius: splashRadius,
            iconSize: size,
          ),
          cupertino: (context, platform) => CupertinoIconButtonData(
            padding: padding ?? EdgeInsets.zero,
          ),
        ),
        if (text != null) Text(text!),
      ],
    );
  }
}
