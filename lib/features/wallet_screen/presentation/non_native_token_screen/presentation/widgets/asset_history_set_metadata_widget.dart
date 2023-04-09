part of '../non_native_token_screen.dart';

class AssetHistorySetMetadataWidget extends StatelessWidget {
  final AssetHistorySetMetadata data;

  const AssetHistorySetMetadataWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final tbd = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    final textStyles = Theme.of(context).customTextStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        Text.rich(
          TextSpan(
            text: 'set_metadata_asset_history_label'.tr(args: [tbd.id ?? '']) +
                '\n\n',
            style: textStyles.d3pBodyLarge,
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
