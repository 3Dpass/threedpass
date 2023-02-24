import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pBodyLargeText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const D3pBodyLargeText(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(final BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).customTextStyles.d3pBodyLarge,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
