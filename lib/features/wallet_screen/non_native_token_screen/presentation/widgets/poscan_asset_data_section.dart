import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/other/copy_span_widget.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/paddings.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class PoscanAssetDataSection extends StatelessWidget {
  const PoscanAssetDataSection({required this.poscanAssetData, super.key});

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
      FastRichText(
        mainText: poscanAssetData.supply,
        secondaryText: 'poscan_asset_page_supply_secondary'.tr(),
        needSpace: true,
      ),
      FastRichText(
        mainText: poscanAssetData.accounts,
        secondaryText: 'poscan_asset_page_accounts_secondary'.tr(),
        needSpace: true,
      ),
    ];
    // TODO Show object details
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (final context, final i) => children[i],
      separatorBuilder: (final context, final i) => const SizedBoxH8(),
      itemCount: children.length,
    );
  }
}
