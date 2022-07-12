import 'package:flutter/material.dart';

class HashPrimitiveItem extends StatelessWidget {
  const HashPrimitiveItem({
    Key? key,
     required this.hash,
  }) : super(key: key);

  final String hash;

  @override
  Widget build(BuildContext context) {
    return Text(hash);
  }
}