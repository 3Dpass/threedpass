import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class FastRichText extends StatelessWidget {
  const FastRichText({
    required this.mainText,
    required this.secondaryText,
    this.needSpace = false,
    this.mainTextStyle,
    super.key,
  });

  final String secondaryText;
  final String mainText;
  final bool needSpace;
  final TextStyle? mainTextStyle;

  @override
  Widget build(final BuildContext context) {
    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;

    return Text.rich(
      TextSpan(
        text: needSpace ? secondaryText + ' ' : secondaryText,
        style: medium.copyWith(color: D3pColors.disabled),
        children: [
          TextSpan(
            text: mainText,
            style: mainTextStyle ?? medium,
          ),
        ],
      ),
    );
  }
}
