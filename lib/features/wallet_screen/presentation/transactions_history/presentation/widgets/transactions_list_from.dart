part of '../transactions_history_page.dart';

class TransactionsListFrom extends StatelessWidget {
  const TransactionsListFrom({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return _TransactionsList(
      pagingController:
          BlocProvider.of<TransfersFromCubit>(context).pagingController,
      isFrom: true,
    );
  }
}
