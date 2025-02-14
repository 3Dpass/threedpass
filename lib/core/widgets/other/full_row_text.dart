import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';

class FullRowText extends StatelessWidget {
  const FullRowText({
    required this.leftText,
    required this.rightText,
    this.translateLeft = true,
    super.key,
  });

  final String leftText;
  final String rightText;
  final bool translateLeft;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final mediumSecondary = medium!.copyWith(color: D3pColors.disabled);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(translateLeft ? leftText.tr() : leftText, style: mediumSecondary),
        Text(rightText, style: medium),
      ],
    );
  }
}
