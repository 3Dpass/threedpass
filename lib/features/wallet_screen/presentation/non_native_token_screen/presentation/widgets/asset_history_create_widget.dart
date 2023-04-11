part of '../non_native_token_screen.dart';

class AssetHistoryCreateWidget extends StatelessWidget {
  final AssetHistoryCreate data;

  const AssetHistoryCreateWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
        .getExtrinsics
        .params
        .tokenBalanceData;
    return Column(
      children: [
        Text('CREATE TOKEN'),
        Text(data.extrisincStatus.toString()),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
