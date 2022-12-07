part of '../assets_page.dart';

class _OpenHistory extends StatelessWidget {
  const _OpenHistory({final Key? key}) : super(key: key);

  void _onPressed(final BuildContext context) {
    unawaited(context.router.push(const TransactionsHistoryRoute()));
  }

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      text: 'Show transactions MOVE TO JSON',
      onPressed: () => _onPressed(context),
    );
  }
}
