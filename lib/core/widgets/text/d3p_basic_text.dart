import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class D3pBasicText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool translate;

  const D3pBasicText(
    this.text, {
    required this.style,
    super.key,
    this.textAlign,
    this.overflow,
    this.translate = true,
  });

  @override
  Widget build(final BuildContext context) {
    return Text(
      translate ? text.tr() : text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
