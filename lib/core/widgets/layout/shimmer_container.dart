import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    required this.child,
    required this.useShimmer,
    super.key,
  });

  final Widget child;
  final bool useShimmer;

  @override
  Widget build(final BuildContext context) => Container(
        decoration: BoxDecoration(
          color: useShimmer ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(D3pCardTheme.radius),
        ),
        child: child,
      );
}
