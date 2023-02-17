import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pTextButton extends StatelessWidget {
  const D3pTextButton({
    required this.text,
    final Key? key,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final double? height;
  final EdgeInsets? padding;
  final String text;
  final Color? textColor;
  final double? width;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: PlatformTextButton(
          onPressed: onPressed,
          material: (final _, final __) => MaterialTextButtonData(
            style: TextButton.styleFrom(
              foregroundColor:
                  textColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          cupertino: (final _, final __) => CupertinoTextButtonData(),
          child: Text(text),
        ),
      ),
    );
  }
}
