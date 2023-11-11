import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/coin_transfer_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/recieve_button.dart';

class AssetPageButtonsPanel extends StatelessWidget {
  const AssetPageButtonsPanel({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 16),
        Flexible(
          flex: 3,
          child: CoinTransferButton(),
        ),
        SizedBox(width: 8),
        Flexible(
          child: RecieveButton(),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
