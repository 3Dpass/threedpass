import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/states/build_or_loading.dart';
import 'package:threedpass/core/polkawallet/utils/balance_utils.dart';
import 'package:threedpass/core/utils/list_extensions.dart';
import 'package:threedpass/core/widgets/other/fast_rich_text.dart';
import 'package:threedpass/core/widgets/other/vertical_line_left_border.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/domain/entities/raw_pending_poscan_atomic_swap_data.dart';
import 'package:threedpass/features/common/link_to_page/entities/link_to_poscan_asset_page_params.dart';
import 'package:threedpass/features/common/link_to_page/ui/basic_link_to_page.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class PoscanAtomicSwapAction extends StatelessWidget {
  const PoscanAtomicSwapAction({
    required this.action,
  });

  final RawPendingPoscanAtomicSwapAction action;

  @override
  Widget build(final BuildContext context) {
    return VerticalLineLeftBorder(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          FastRichText(
            mainText: action.assetId.toString(),
            secondaryText: 'set_metadata_notification_asset_id'.tr(),
            needSpace: true,
          ),
          BuildOrLoading<PoscanAssetsCubit, PoscanAssetsState>(
            builder: (final PoscanAssetsState state) {
              final asset = state.combined.firstWhereOrNull(
                  (final e) => e.poscanAssetData.id == action.assetId);
              if (asset != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    FastRichText(
                      mainText: BalanceUtils.formattedBigInt(
                        action.value,
                        asset.poscanAssetMetadata?.idecimals ?? 0,
                      ),
                      needSpace: true,
                      secondaryText: asset.poscanAssetMetadata != null
                          ? 'Amount:'
                          : 'Raw amount:',
                    ),
                    BasicLinkToPage(
                      params: LinkToPoscanAssetPageParams(
                        asset: asset.poscanAssetData,
                        context: context,
                      ),
                    ),
                  ],
                );
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
