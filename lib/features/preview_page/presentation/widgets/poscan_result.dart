import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';

class PoscanResult extends StatelessWidget {
  const PoscanResult();

  @override
  Widget build(BuildContext context) {
    return Padding16(
      child: D3pElevatedButton(
        text: 'Upload to 3DRPC-2',
        onPressed: () {},
      ),
    );
  }
}
