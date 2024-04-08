import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    required this.child,
    required this.onTap,
    this.side,
    this.radius,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    super.key,
  });

  final void Function()? onTap;
  final Widget child;
  final BorderSide? side;
  final Radius? radius;
  final EdgeInsetsGeometry padding;

  static const buttonPaddingPreset =
      EdgeInsets.symmetric(vertical: 12, horizontal: 8);

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      side: side,
      // radius: radius,
      child: InkWell(
        onTap: onTap,
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
