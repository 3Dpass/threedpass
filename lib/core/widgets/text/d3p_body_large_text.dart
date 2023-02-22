import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pBodyLargeText extends StatelessWidget {
  final String text;

  const D3pBodyLargeText(this.text, {super.key});
  @override
  Widget build(final BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).customTextStyles.d3pBodyLarge,
    );
  }
}
