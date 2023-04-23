part of '../non_native_token_screen.dart';

class AssetHistorySetMetadataWidget extends StatelessWidget {
  final AssetHistorySetMetadata data;

  const AssetHistorySetMetadataWidget(this.data, {super.key});

  @override
  Widget build(final BuildContext context) {
    final tbd = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    final textStyles = Theme.of(context).customTextStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        Row(
          children: [
            D3pBodyLargeText(
              'set_metadata_asset_history_label'.tr(args: [tbd.id ?? '']),
              translate: false,
            ),
            const SizedBox(width: 16),
            ExtrinsicStatusIcon(data.extrisincStatus),
          ],
        ),
        // const SizedBoxH8(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'set_metadata_asset_history_name'.tr(args: [data.name]) +
                    '\n',
                style: textStyles.d3pBodyMedium,
              ),
              TextSpan(
                text: 'set_metadata_asset_history_symbol'
                        .tr(args: [data.symbol]) +
                    '\n',
                style: textStyles.d3pBodyMedium,
              ),
              TextSpan(
                text: 'set_metadata_asset_history_decimals'
                    .tr(args: [data.decimals]),
                style: textStyles.d3pBodyMedium,
              ),
            ],
          ),
        ),
        const SizedBoxH8(),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
