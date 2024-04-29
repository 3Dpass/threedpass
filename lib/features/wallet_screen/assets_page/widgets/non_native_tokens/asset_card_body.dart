import 'package:flutter/material.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';

class AssetCardBody extends StatelessWidget {
  const AssetCardBody({
    required this.metadata,
    required this.balance,
    super.key,
  });

  final PoscanAssetMetadata metadata;
  final PoscanAssetBalance? balance;

  String balanceText() {
    if (balance != null) {
      return BalanceUtils.formattedBigInt(
        balance!.decodedRawBalance,
        metadata.idecimals,
      );
    } else {
      return '0';
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: D3pBodyMediumText(
            metadata.name,
            translate: false,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: balanceText(),
              children: [
                const TextSpan(text: ' '),
                TextSpan(text: metadata.symbol),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
