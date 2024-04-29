import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/router/router.gr.dart';

class PoscanAssetMetadataSection extends StatelessWidget {
  const PoscanAssetMetadataSection({
    required this.metadata,
    required this.poscanAssetData,
    super.key,
  });

  final PoscanAssetMetadata? metadata;
  final PoscanAssetData poscanAssetData;

  void onPressed(final BuildContext context) {
    context.router.push(
      SetMetadataRouteWrapper(initialAssetId: poscanAssetData.id),
    );
  }

  @override
  Widget build(final BuildContext context) {
    if (metadata == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const D3pBodyMediumText('poscan_asset_page_metadata_help'),
          const SizedBoxH8(),
          D3pElevatedButton(
            text: 'poscan_asset_page_metadata_button_label'.tr(),
            onPressed: () => onPressed(context),
          ),
        ],
      );
    } else {
      final children = [
        FastRichText(
          mainText: metadata!.name,
          secondaryText: 'poscan_asset_page_name_secondary'.tr(),
          needSpace: true,
        ),
        FastRichText(
          mainText: metadata!.symbol,
          secondaryText: 'poscan_asset_page_symbol_secondary'.tr(),
          needSpace: true,
        ),
      ];
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final context, final i) => children[i],
        separatorBuilder: (final context, final i) => const SizedBoxH8(),
        itemCount: children.length,
      );
    }
  }
}
