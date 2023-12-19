part of '../non_native_token_screen.dart';

class AssetHistoryUnknownWidget extends StatelessWidget {
  final AssetHistoryUnkown data;

  const AssetHistoryUnknownWidget(this.data, {super.key});

  @override
  Widget build(final BuildContext context) {
    // final cubit = BlocProvider.of<AssetsGetExtrinsicsCubit>(context)
    //     .getExtrinsics
    //     .params
    //     .tokenBalanceData;
    return Column(
      children: [
        Text(data.extrisincStatus.toString()),
        const Text('Unknown Event'),
        Text(data.callModule),
        Text(data.arguments),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
