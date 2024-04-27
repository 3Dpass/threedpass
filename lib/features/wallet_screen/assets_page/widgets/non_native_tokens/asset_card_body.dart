import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_combined.dart';

class AssetCardBody extends StatelessWidget {
  const AssetCardBody({required this.poscanAssetCombined, super.key});

  final PoscanAssetCombined poscanAssetCombined;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // METADATA OR NO METADATA
        D3pBodyMediumText(
          'METADATA', // data.tokenData.fullName ?? '',
          translate: false,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            D3pBodyMediumText(
              '10.0',
              // data.balance.toString(),
              translate: false,
            ),
            const SizedBox(width: 8),
            D3pBodyMediumText(
              'TUI', // data.tokenData.symbols ?? '',
              translate: false,
            ),
          ],
        ),
      ],
    );
  }
}
