import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

class D3pCardElevatedButton extends StatelessWidget {
  const D3pCardElevatedButton({
    required this.iconData,
    required this.text,
    required this.onPressed,
    final Key? key,
  }) : super(key: key);

  final IconData iconData;
  final void Function()? onPressed;
  final String text;

  bool get isActive => onPressed != null;

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return D3pElevatedButton(
      text: text,
      iconData: iconData,
      onPressed: onPressed,
      backgroundColor: _ElevatedButtonDefaultBackground(
        colorScheme.onPrimary,
        colorScheme.onSurface,
      ).resolve(isActive),
      foregroundColor: _ElevatedButtonDefaultForeground(
        colorScheme.onPrimary,
        colorScheme.onSurface,
      ).resolve(isActive),
    );
  }
}

/// Just copied from https://github.com/flutter/flutter/blob/b8f7f1f9869bb2d116aa6a70dbeac61000b52849/packages/flutter/lib/src/material/elevated_button.dart#L182
class _ElevatedButtonDefaultForeground {
  _ElevatedButtonDefaultForeground(this.onPrimary, this.onSurface);

  final Color onPrimary;
  final Color onSurface;

  Color resolve(bool isActive) {
    if (isActive) {
      return onSurface.withOpacity(0.38);
    } else {
      return onPrimary;
    }
  }
}

/// Just copied from https://github.com/flutter/flutter/blob/b8f7f1f9869bb2d116aa6a70dbeac61000b52849/packages/flutter/lib/src/material/elevated_button.dart#L177
class _ElevatedButtonDefaultBackground {
  _ElevatedButtonDefaultBackground(this.onPrimary, this.onSurface);

  final Color onPrimary;
  final Color onSurface;

  Color resolve(bool isActive) {
    if (isActive) {
      return onSurface.withOpacity(0.12);
    } else {
      return onPrimary;
    }
  }
}
