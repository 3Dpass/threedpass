import 'package:flutter/material.dart';

class D3pProgressIndicator extends StatelessWidget {
  const D3pProgressIndicator({
    required this.size,
    this.strokeWidth = 4,
    super.key,
  });

  final double strokeWidth;
  final double size;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
