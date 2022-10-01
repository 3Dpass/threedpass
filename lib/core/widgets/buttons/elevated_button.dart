import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pElevatedButton extends StatelessWidget {
  const D3pElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformElevatedButton(
          padding: padding ?? EdgeInsets.zero,
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
          onPressed: onPressed,
          material: (context, _) => MaterialElevatedButtonData(
            style: ElevatedButton.styleFrom(
              minimumSize: minimumSize ?? const Size.fromHeight(50),
            ),
          ),
        ),
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    Key? key,
    required this.iconData,
    required this.icon,
  }) : super(key: key);

  final IconData? iconData;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
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
