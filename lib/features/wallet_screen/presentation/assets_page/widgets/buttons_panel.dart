import 'package:flutter/material.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/recieve_button.dart';
import 'package:threedpass/features/wallet_screen/presentation/assets_page/widgets/transfer_button.dart';

class AssetPageButtonsPanel extends StatelessWidget {
  const AssetPageButtonsPanel({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        SizedBox(width: 16),
        Flexible(
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
