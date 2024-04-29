import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class AssetCardNoMetadata extends StatelessWidget {
  const AssetCardNoMetadata({required this.poscanAssetData, super.key});

  final PoscanAssetData poscanAssetData;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FastRichText(
          mainText: poscanAssetData.id.toString(),
          secondaryText: 'poscan_asset_card_asset_id'.tr() + ' ',
        ),
        const D3pBodyMediumText('poscan_asset_card_no_metadata'),
      ],
    );
  }
}
