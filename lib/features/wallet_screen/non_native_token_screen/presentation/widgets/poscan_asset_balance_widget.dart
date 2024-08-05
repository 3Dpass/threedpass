import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/wallet_screen/widgets/asset_balance_text.dart';

class PoscanAssetBalanceWidget extends StatelessWidget {
  const PoscanAssetBalanceWidget({
    required this.poscanAssetBalance,
    required this.metadata,
    super.key,
  });

  final PoscanAssetBalance? poscanAssetBalance;
  final PoscanAssetMetadata metadata;

  @override
  Widget build(final BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AssetBalanceText(
        balance: BalanceUtils.formattedBigInt(
          poscanAssetBalance != null
              ? BigInt.parse(poscanAssetBalance!.balance)
              : BigInt.zero,
          int.parse(metadata.decimals),
        ),
        tokenSymbol: metadata.symbol,
      ),
    );
  }
}
