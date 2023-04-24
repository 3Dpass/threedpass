part of '../non_native_token_screen.dart';

class AssetHistoryCreateWidget extends StatelessWidget {
  final AssetHistoryCreate data;

  const AssetHistoryCreateWidget(this.data, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const D3pBodyLargeText('create_token_widget'),
            const SizedBox(width: 16),
            ExtrinsicStatusIcon(data.extrisincStatus),
          ],
        ),
        BlockDateTimeW(
          data.blockDatetime,
        ),
      ],
    );
  }
}
