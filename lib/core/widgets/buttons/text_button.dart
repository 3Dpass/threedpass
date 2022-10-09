import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pTextButton extends StatelessWidget {
  const D3pTextButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final double? height;
  final double? width;
  final EdgeInsets? padding;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        height: height,
        width: width,
        child: PlatformTextButton(
          child: Text(text),
          onPressed: onPressed,
          material: (_, __) => MaterialTextButtonData(
            style: TextButton.styleFrom(
              primary: textColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          cupertino: (_, __) => CupertinoTextButtonData(
            color: textColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
