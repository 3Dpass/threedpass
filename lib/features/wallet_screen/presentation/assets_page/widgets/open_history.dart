part of '../assets_page.dart';

class _OpenHistory extends StatelessWidget {
  const _OpenHistory({final Key? key}) : super(key: key);

  void _onPressed(final BuildContext context) {
    unawaited(context.router.push(const TransactionsHistoryRoute()));
  }

  @override
  Widget build(final BuildContext context) {
    return D3pElevatedButton(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      text: 'show_transfers'.tr(),
      onPressed: () => _onPressed(context),
    );
  }
}
