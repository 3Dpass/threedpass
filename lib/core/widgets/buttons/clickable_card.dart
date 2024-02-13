import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    required this.child,
    required this.onTap,
    this.side,
    this.radius,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;
  final BorderSide? side;
  final Radius? radius;

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      side: side,
      radius: radius,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
