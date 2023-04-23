part of '../non_native_token_screen.dart';

class AssetHistoryMintWidget extends StatelessWidget {
  final AssetHistoryMint data;

  const AssetHistoryMintWidget(this.data, {super.key});

  @override
  Widget build(final BuildContext context) {
    final cubit = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBoxH8(),
        Row(
          children: [
            D3pBodyLargeText(
              'mint_asset_history_label'.tr(
                args: [data.value, cubit.symbol ?? ''],
              ),
              translate: false,
            ),
            const SizedBox(width: 16),
            ExtrinsicStatusIcon(data.extrisincStatus),
          ],
        ),
        const SizedBoxH8(),
        ShortAddress(
          address: data.authorAddress,
          colorSecondary: true,
          prefix: 'mint_asset_history_prefix'.tr(),
        ),
        const SizedBoxH8(),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
