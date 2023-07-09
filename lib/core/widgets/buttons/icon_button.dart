import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pIconButton extends StatelessWidget {
  const D3pIconButton({
    required this.iconData,
    this.onPressed,
    this.iconColor,
    super.key,
  });

  const D3pIconButton.fake({
    super.key,
  })  : iconData = Icons.abc,
        iconColor = Colors.transparent,
        onPressed = null;

  final IconData iconData;
  final Color? iconColor;
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    return PlatformIconButton(
      icon: Icon(
        iconData,
        color: iconColor,
      ),
      onPressed: onPressed,
    );
  }
}
