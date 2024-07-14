import 'package:flutter/material.dart';

class D3pProgressIndicator extends StatelessWidget {
  const D3pProgressIndicator({this.strokeWidth = 4, super.key});

  final double strokeWidth;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth,
      ),
    );
  }
}
