import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    required this.text,
    final Key? key,
    this.onPressed,
    this.iconData,
    this.minimumSize,
    this.padding,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.childAlignment,
    this.textStyle,
    this.child,
    this.shape,
  }) : super(key: key);

  final void Function()? onPressed;
  final String? text;
  final IconData? iconData;
  final Size? minimumSize;
  final EdgeInsets? padding;
  final Widget? icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? elevation;
  final MainAxisAlignment? childAlignment;
  final TextStyle? textStyle;
  final Widget? child;
  final OutlinedBorder? shape;

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
                childAlignment: childAlignment,
              ),
          // TODO CHECK CUPERTINO
          material: (final context, final platform) =>
              MaterialElevatedButtonData(
            style: ButtonStyle(
              backgroundColor: backgroundColor != null
                  ? MaterialStateProperty.all(backgroundColor)
                  : null,
              elevation: elevation != null
                  ? MaterialStateProperty.all(elevation)
                  : null,
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 8),
              ),
              shape: shape != null ? MaterialStateProperty.all(shape) : null,
              textStyle: textStyle != null
                  ? MaterialStateProperty.all(
                      textStyle,
                    )
                  : MaterialStateProperty.all(
                      style,
                    ),
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
    this.childAlignment,
  });

  final String text;
  final IconData? iconData;
  final Widget? icon;
  final MainAxisAlignment? childAlignment;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: childAlignment ?? MainAxisAlignment.center,
      children: [
        (icon != null || iconData != null)
            ? _Icon(
                icon: icon,
                iconData: iconData,
                isTextEmpty: text.isEmpty,
              )
            : const SizedBox(),
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
