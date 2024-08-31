import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_meta_dto.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAssetTransferFloatingButton extends StatelessWidget {
  const PoscanAssetTransferFloatingButton({
    required this.poscanAssetMetadata,
    required this.poscanAssetBalance,
    super.key,
  });

  final PoscanAssetMetadata? poscanAssetMetadata;
  final PoscanAssetBalance? poscanAssetBalance;

  void onPressed(final BuildContext context) {
    context.router.push(
      TransferRouteWrapper(
        metadata: AssetTransferMetaDTO(
          name: poscanAssetMetadata!.symbol,
          decimals: poscanAssetMetadata!.idecimals,
          assetId: poscanAssetMetadata!.id,
          rawInitialAmount: poscanAssetBalance!.balance,
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final isEnabled = poscanAssetMetadata != null && poscanAssetBalance != null;

    return Visibility(
      visible: isEnabled,
      child: FloatingActionButton(
        onPressed: isEnabled ? () => onPressed(context) : null,
        child: const Icon(Icons.arrow_upward_rounded),
      ),
    );
  }
}
