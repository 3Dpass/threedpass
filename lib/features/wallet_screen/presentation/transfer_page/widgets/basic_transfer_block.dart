import 'package:flutter/material.dart';

class BasicTransferBlock extends StatelessWidget {
  const BasicTransferBlock({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: child,
      ),
    );
  }
}
