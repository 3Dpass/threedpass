import 'package:flutter/material.dart';

class Padding16 extends StatelessWidget {
  final Widget child;

  const Padding16({required this.child, super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      );
}
