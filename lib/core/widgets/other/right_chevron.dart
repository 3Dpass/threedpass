import 'package:flutter/material.dart';

class RightChevron extends StatelessWidget {
  const RightChevron({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_outlined,
      size: 16,
      color: color,
    );
  }
}
