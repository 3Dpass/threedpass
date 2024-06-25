import 'package:flutter/material.dart';

class VerticalLineLeftBorder extends StatelessWidget {
  const VerticalLineLeftBorder({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final divColor = Theme.of(context).dividerColor;

    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: divColor,
            width: 2.0,
          ),
        ),
      ),
      child: child,
    );
  }
}
