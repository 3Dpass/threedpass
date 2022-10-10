import 'package:flutter/material.dart';
import 'package:threedpass/features/web_wallet/presentation/explorer_card/open_explorer_button.dart';

class OpenWebWalletCard extends StatelessWidget {
  const OpenWebWalletCard({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: OpenWebWalletButton(),
      ),
    );
  }
}
