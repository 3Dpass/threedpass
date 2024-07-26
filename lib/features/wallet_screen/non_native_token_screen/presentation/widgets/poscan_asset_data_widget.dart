import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/layout/list_view_separated.dart';
import 'package:threedpass/core/widgets/other/copy_span_widget.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/presentation/widgets/object_details_rich_text.dart';

class PoscanAssetDataWidget extends StatelessWidget {
  const PoscanAssetDataWidget({required this.poscanAssetData, super.key});

  final PoscanAssetData poscanAssetData;

  @override
  Widget build(final BuildContext context) {
    final children = [
      FastRichText(
        mainText: poscanAssetData.id.toString(),
        secondaryText: 'poscan_asset_page_id_secondary'.tr(),
        needSpace: true,
      ),
      CopySpanWidget(
        textToCopy: poscanAssetData.owner,
        textToShow: null,
        child: FastRichText(
          mainText: poscanAssetData.owner,
          secondaryText: 'poscan_asset_page_owner_secondary'.tr(),
          needSpace: true,
        ),
      ),
      FastRichText(
        mainText: poscanAssetData.minBalance,
        secondaryText: 'poscan_asset_page_min_balance_secondary'.tr(),
        needSpace: true,
      ),
      ObjectDetailsRichText(
        objDetails: poscanAssetData.objDetails,
      ),
      FastRichText(
        mainText: poscanAssetData.accounts,
        secondaryText: 'poscan_asset_page_accounts_secondary'.tr(),
        needSpace: true,
      ),
    ];
    return ListViewSeparated(children: children);
  }
}
