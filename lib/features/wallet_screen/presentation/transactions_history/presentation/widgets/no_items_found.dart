part of '../transactions_history_page.dart';

class _NoItemsFound extends StatelessWidget {
  const _NoItemsFound({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text('no_transfers'.tr()),
      ),
    );
  }
}
