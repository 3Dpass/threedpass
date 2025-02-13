import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    required this.child,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    this.cardShape = CardShape.all,
    this.side,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final CardShape cardShape;
  final BorderSide? side;

  static const buttonPaddingPreset =
      EdgeInsets.symmetric(vertical: 12, horizontal: 8);

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      child: InkWell(
        child: Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
        onTap: onTap,
        borderRadius: MapperCardShapeToRadius(
          cardShape: cardShape,
          radius: D3pCardTheme.radius,
        ).border(),
      ),
      cardShape: cardShape,
      side: side,
    );
  }
}
