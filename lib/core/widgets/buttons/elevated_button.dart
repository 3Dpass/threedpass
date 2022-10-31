import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    required this.text,
    final Key? key,
    this.onPressed,
    this.iconData,
    this.minimumSize,
    this.padding,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? iconData;
  final Size? minimumSize;
  final EdgeInsets? padding;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    // TODO Turn into OOP
    final theme = Theme.of(context);

    final d3pButtonTheme = onPressed == null
        ? D3pButtonThemeData.disabled(theme)
        : D3pButtonThemeData.active(theme);

    final basicMaterial = ElevatedButton.styleFrom(
      minimumSize: minimumSize ?? const Size.fromHeight(50),
    );
    // TODO Do same for cupertino
    final materialTheme = basicMaterial.copyWith(
      foregroundColor:
          MaterialStateProperty.all(d3pButtonTheme.foregroundColor),
      backgroundColor:
          MaterialStateProperty.all(d3pButtonTheme.backgroundColor),
    );

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformElevatedButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onPressed,
          material: (final context, final _) => MaterialElevatedButtonData(
            style: materialTheme,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Icon(
                icon: icon,
                iconData: iconData,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}

class D3pButtonThemeData {
  final Color backgroundColor;
  final Color foregroundColor;

  D3pButtonThemeData({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  D3pButtonThemeData.active(final ThemeData themeData)
      : backgroundColor = themeData.colorScheme.primary,
        foregroundColor = themeData.colorScheme.onPrimary;

  D3pButtonThemeData.disabled(final ThemeData themeData)
      : backgroundColor = themeData.cardColor,
        foregroundColor = themeData.colorScheme.onSurface.withOpacity(0.50);
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.iconData,
    required this.icon,
    final Key? key,
  }) : super(key: key);

  final IconData? iconData;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    assert(
      icon == null || iconData == null,
      'Either icon or iconData must be provided. Now both icon and iconData are not null.',
    );

    if (iconData != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Icon(iconData),
      );
    } else if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: icon,
      );
    } else {
      return const SizedBox();
    }
  }
}
