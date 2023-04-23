part of '../non_native_token_screen.dart';

class _NoHistoryFound extends StatelessWidget {
  const _NoHistoryFound({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: D3pBodyMediumText('no_asset_history'),
      ),
    );
  }
}
