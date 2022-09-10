import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pTextButton extends StatelessWidget {
  const D3pTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
