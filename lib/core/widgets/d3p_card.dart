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
    final borderRadius = MapperCardShapeToRadius(
      cardShape: cardShape,
      radius: radius,
    ).border();

    switch (cardShape) {
      case CardShape.top:
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
        );
      case CardShape.bottom:
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
        );
      case CardShape.middle:
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
        );
      case CardShape.all:
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
        );
    }
  }
}

class MapperCardShapeToRadius {
  final CardShape cardShape;
  final Radius radius;

  MapperCardShapeToRadius({
    required this.cardShape,
    required this.radius,
  });

  BorderRadius border() {
    switch (cardShape) {
      case CardShape.top:
        return BorderRadius.only(topLeft: radius, topRight: radius);
      case CardShape.bottom:
        return BorderRadius.only(bottomLeft: radius, bottomRight: radius);
      case CardShape.middle:
        return BorderRadius.zero;
      case CardShape.all:
        return BorderRadius.all(radius);
    }
  }
}
