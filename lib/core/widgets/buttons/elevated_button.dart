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
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? iconData;
  final Size? minimumSize;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        child: PlatformElevatedButton(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconData != null ? Icon(iconData) : const SizedBox(),
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
