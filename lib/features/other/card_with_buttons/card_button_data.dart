import 'package:flutter/material.dart';

class CardButtonData {
  final Widget icon;
  final VoidCallback? onButtonPressed;
  final int? badge;

  const CardButtonData({
    required this.icon,
    this.onButtonPressed,
    this.badge,
  });
}
