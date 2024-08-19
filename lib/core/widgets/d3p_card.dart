import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';

class D3pCard extends StatelessWidget {
  final Widget child;
  final CardShape cardShape;
  final BorderSide? side;
  final Radius? radius;

  const D3pCard({
    required this.child,
    this.cardShape = CardShape.all,
    this.side,
    this.radius,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    // final bgColor = Theme.of(context).customColors.cardBackground;
    return Card(
      margin: EdgeInsets.zero,
      shape: MapperCardShapeToBorder(
        cardShape: cardShape,
        side: side,
        radius: radius,
      ).border(),
      // color: bgColor,
      child: child,
    );
  }
}

enum CardShape { top, middle, bottom, all }

class MapperCardShapeToBorder {
  final CardShape cardShape;
  final BorderSide? side;
  final Radius radius;

  const MapperCardShapeToBorder({
    required this.cardShape,
    required this.side,
    final Radius? radius,
  }) : this.radius = radius ?? D3pCardTheme.radius;

  ShapeBorder border() {
    switch (cardShape) {
      case CardShape.top:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
          side: side ?? BorderSide.none,
        );
      case CardShape.bottom:
        return RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomLeft: radius, bottomRight: radius),
          side: side ?? BorderSide.none,
        );
      case CardShape.middle:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: side ?? BorderSide.none,
        );
      case CardShape.all:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radius),
          side: side ?? BorderSide.none,
        );
    }
  }
}
