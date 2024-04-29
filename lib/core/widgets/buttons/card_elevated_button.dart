import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';

// TODO REMOVE
@Deprecated('Never use this. Use D3pElevatedButton instead')
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
    final theme = Theme.of(context);
    return D3pElevatedButton(
      text: text,
      iconData: iconData,
      onPressed: onPressed,
      backgroundColor: _ElevatedButtonDefaultBackground(
        themeData: theme,
        isActive: isActive,
      ).resolve(),
      foregroundColor: _D3pCardElevatedButtonForeground(
        isActive: isActive,
        themeData: theme,
      ).resolve(),
    );
  }
}

class _D3pCardElevatedButtonForeground {
  _D3pCardElevatedButtonForeground({
    required this.isActive,
    required this.themeData,
  });

  final bool isActive;
  final ThemeData themeData;

  Color resolve() {
    final brightness = themeData.brightness;

    if (isActive) {
      return themeData.colorScheme.onPrimary;
    } else {
      return brightness == Brightness.light
          ? themeData.colorScheme.onSurface.withOpacity(0.38)
          : themeData.customColors.disabled;
    }
  }
}

/// Copied from https://github.com/flutter/flutter/blob/b8f7f1f9869bb2d116aa6a70dbeac61000b52849/packages/flutter/lib/src/material/elevated_button.dart#L177
class _ElevatedButtonDefaultBackground {
  _ElevatedButtonDefaultBackground({
    required this.isActive,
    required this.themeData,
  });

  final bool isActive;
  final ThemeData themeData;

  Color resolve() {
    if (isActive) {
      return themeData.colorScheme.primary;
    } else {
      return themeData.colorScheme.onSurface.withOpacity(0.12);
    }
  }
}
