import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';

class FullRowText extends StatelessWidget {
  const FullRowText({
    required this.leftText,
    required this.rightText,
    super.key,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    final mediumSecondary = medium!.copyWith(color: D3pColors.disabled);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: mediumSecondary,
        ),
        Text(
          rightText,
          style: medium,
        ),
      ],
    );
  }
}
