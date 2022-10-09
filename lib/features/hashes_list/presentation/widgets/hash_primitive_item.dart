import 'package:flutter/material.dart';

class HashPrimitiveItem extends StatelessWidget {
  const HashPrimitiveItem({
    required this.hash,
    final Key? key,
  }) : super(key: key);

  final String hash;

  @override
  Widget build(final BuildContext context) {
    return Text(hash);
  }
}
