import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';

class FastRichText extends StatelessWidget {
  const FastRichText({
    required this.mainText,
    required this.secondaryText,
    this.needSpace = false,
    this.mainTextColor,
    this.secondaryTextColor,
    super.key,
  });

  final String secondaryText;
  final String mainText;
  final bool needSpace;
  final Color? secondaryTextColor;
  final Color? mainTextColor;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).textTheme.bodyMedium;
    return Text.rich(
      TextSpan(
        text: needSpace ? secondaryText + ' ' : secondaryText,
        style: medium!.copyWith(
          color: secondaryTextColor ?? D3pColors.disabled,
        ),
        children: [
          TextSpan(
            text: mainText,
            style: mainTextColor != null
                ? medium.copyWith(color: mainTextColor)
                : medium,
          ),
        ],
      ),
    );
  }
}
