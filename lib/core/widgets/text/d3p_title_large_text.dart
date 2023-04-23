import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/text/d3p_basic_text.dart';

class D3pTitleLargeText extends StatelessWidget {
  final String text;

  const D3pTitleLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return D3pBasicText(
      text,
      style: Theme.of(context).customTextStyles.d3ptitleLarge,
    );
  }
}
