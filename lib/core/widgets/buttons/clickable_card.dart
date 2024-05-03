import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    required this.child,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    this.side,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderSide? side;

  static const buttonPaddingPreset =
      EdgeInsets.symmetric(vertical: 12, horizontal: 8);

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      side: side,
      // radius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(D3pCardTheme.radius),
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
