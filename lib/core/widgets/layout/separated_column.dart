import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/paddings.dart';

class SeparatedColumn extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;

  const SeparatedColumn({
    required this.children,
    this.separator = const H8(),
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final List<Widget> result = [];
    for (var i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(separator);
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: result,
    );
  }
}
