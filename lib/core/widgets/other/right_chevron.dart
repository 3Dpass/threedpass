import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class RightChevron extends StatelessWidget {
  const RightChevron({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(final BuildContext context) {
    final colors = Theme.of(context).customColors;
    final iconColor = colors.moreFadedGrey;
    return Icon(
      Icons.arrow_forward_ios_outlined,
      size: 16,
      color: color ?? iconColor,
    );
  }
}
