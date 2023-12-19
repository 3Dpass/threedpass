import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class NoTransferItemsFound extends StatelessWidget {
  const NoTransferItemsFound({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: D3pBodyMediumText('no_transfers'),
      ),
    );
  }
}
