import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class HashPrimitiveItem extends StatelessWidget {
  const HashPrimitiveItem({
    required this.hash,
    final Key? key,
  }) : super(key: key);

  final String hash;

  @override
  Widget build(final BuildContext context) {
    return D3pBodyMediumText(
      hash,
      translate: false,
    );
  }
}
