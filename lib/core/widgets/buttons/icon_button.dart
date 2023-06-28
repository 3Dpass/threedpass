import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pIconButton extends StatelessWidget {
  const D3pIconButton({
    required this.iconData,
    required this.onPressed,
    super.key,
  });

  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(final BuildContext context) {
    return PlatformIconButton(
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
