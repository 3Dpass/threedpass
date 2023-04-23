import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/text/d3p_basic_text.dart';

class D3pBodyLargeText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool translate;

  const D3pBodyLargeText(
    this.text, {
    super.key,
    this.textAlign,
    this.overflow,
    this.translate = true,
  });

  @override
  Widget build(final BuildContext context) {
    return D3pBasicText(
      text,
      style: Theme.of(context).customTextStyles.d3pBodyLarge,
      textAlign: textAlign,
      overflow: overflow,
      translate: translate,
    );
  }
}
