import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
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
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 24,
        children: [
          Text('Your balance:',
              style: Theme.of(context).customTextStyles.fadedBodyMedium),
          AssetBalanceText(
            balance: BalanceUtils.formattedBigInt(
              poscanAssetBalance != null
                  ? poscanAssetBalance!.decodedRawBalance
                  : BigInt.zero,
              int.parse(metadata.decimals),
            ),
            tokenSymbol: metadata.symbol,
          ),
        ],
      ),
    );
  }
}
