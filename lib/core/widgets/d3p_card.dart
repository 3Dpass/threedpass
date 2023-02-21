import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pCard extends StatelessWidget {
  final Widget child;

  const D3pCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bgColor = Theme.of(context).customColors.cardBackground;
    return Card(
      color: bgColor,
      child: child,
    );
  }
}
