import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/text/d3p_basic_text.dart';

class D3pBodyMediumText extends StatelessWidget {
  final String text;
  final bool translate;
  final Color? color;
  final TextAlign? textAlign;

  const D3pBodyMediumText(
    this.text, {
    super.key,
    this.translate = true,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(final BuildContext context) {
    return D3pBasicText(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
      translate: translate,
      textAlign: textAlign,
    );
  }
}
