import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    required this.text,
    final Key? key,
    this.onPressed,
    this.iconData,
    this.padding,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
  }) : super(key: key);

  final void Function()? onPressed;
  final String? text;
  final IconData? iconData;
  final EdgeInsets? padding;
  final Widget? icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(final BuildContext context) {
    final style = Theme.of(context).customTextStyles.d3pFloatingButton;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformElevatedButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onPressed,
          child: child ??
              _ElevatedButtonChild(
                icon: icon,
                iconData: iconData,
                text: text ?? '',
              ),
          // TODO CHECK CUPERTINO
          material: (final context, final platform) =>
              MaterialElevatedButtonData(
            style: ButtonStyle(
              foregroundColor: foregroundColor != null
                  ? MaterialStateProperty.all(foregroundColor)
                  : MaterialStateProperty.resolveWith(
                      (final states) {
                        if (states.contains(MaterialState.disabled)) {
                          return D3pColors
                              .disabled; // Theme.of(context).colorScheme.onSurface;
                        } else {
                          return Colors.white;
                        }
                      },
                    ),
              backgroundColor: backgroundColor != null && onPressed != null
                  ? MaterialStateProperty.all(backgroundColor)
                  : null,
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 8),
              ),
              textStyle: MaterialStateProperty.all(style),
            ),
          ),
        ),
      ),
    );
  }
}

class _ElevatedButtonChild extends StatelessWidget {
  const _ElevatedButtonChild({
    required this.icon,
    required this.iconData,
    required this.text,
  });

  final String text;
  final IconData? iconData;
  final Widget? icon;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null || iconData != null)
          _Icon(
            icon: icon,
            iconData: iconData,
            isTextEmpty: text.isEmpty,
          ),
        Text(
          text,
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.iconData,
    required this.icon,
    required this.isTextEmpty,
    final Key? key,
  }) : super(key: key);

  final IconData? iconData;
  final Widget? icon;
  final bool isTextEmpty;

  double get padding => isTextEmpty ? 0 : 8;

  @override
  Widget build(final BuildContext context) {
    assert(
      icon == null || iconData == null,
      'Either icon or iconData must be provided. Now both icon and iconData are not null.',
    );

    if (iconData != null) {
      return Padding(
        padding: EdgeInsets.only(right: padding),
        child: Icon(iconData),
      );
    } else if (icon != null) {
      return Padding(
        padding: EdgeInsets.only(right: padding),
        child: icon,
      );
    } else {
      return const SizedBox();
    }
  }
}
