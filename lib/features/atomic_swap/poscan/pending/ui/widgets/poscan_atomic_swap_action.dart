part of 'pending_swap_card.dart';

class _PoscanAtomicSwapAction extends StatelessWidget {
  const _PoscanAtomicSwapAction({
    required this.action,
  });

  final RawPendingPoscanAtomicSwapAction action;

  @override
  Widget build(final BuildContext context) {
    final pas = BlocProvider.of<PoscanAssetsCubit>(context).state;
    final asset = pas.combined
        .firstWhere((final e) => e.poscanAssetData.id == action.assetId);
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
          FastRichText(
            mainText: BalanceUtils.formattedBigInt(
              action.value,
              asset.poscanAssetMetadata?.idecimals ?? 0,
            ),
            needSpace: true,
            secondaryText:
                asset.poscanAssetMetadata != null ? 'Amount:' : 'Raw amount:',
          ),
          BasicLinkToPage(
            params: LinkToPoscanAssetPageParams(
              asset: asset.poscanAssetData,
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
