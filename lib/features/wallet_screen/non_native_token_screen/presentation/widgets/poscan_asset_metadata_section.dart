import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/buttons/elevated_button.dart';
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
      return D3pElevatedButton(
        text: 'poscan_asset_page_metadata_button_label'.tr(),
        onPressed: () => onPressed(context),
      );
    } else {
      return Text('Metadata section ${metadata!.symbols}');
    }
  }
}
