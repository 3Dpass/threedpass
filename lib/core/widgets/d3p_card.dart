import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pCard extends StatelessWidget {
  final Widget child;
  final CardShape cardShape;

  const D3pCard({
    required this.child,
    this.cardShape = CardShape.all,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bgColor = Theme.of(context).customColors.cardBackground;
    return Card(
      margin: EdgeInsets.zero,
      shape: MapperCardShapeToBorder(cardShape).border(),
      color: bgColor,
      child: child,
    );
  }
}

enum CardShape { top, middle, bottom, all }

class MapperCardShapeToBorder {
  final CardShape cardShape;

  const MapperCardShapeToBorder(this.cardShape);

  ShapeBorder border() {
    const radius = Radius.circular(4.0);

    switch (cardShape) {
      case CardShape.top:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        );
      case CardShape.bottom:
        return const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(bottomLeft: radius, bottomRight: radius),
        );
      case CardShape.middle:
        return const RoundedRectangleBorder(borderRadius: BorderRadius.zero);
      case CardShape.all:
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(radius),
        );
    }
  }
}
