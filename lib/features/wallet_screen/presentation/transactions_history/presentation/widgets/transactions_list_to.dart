part of '../transactions_history_page.dart';

class TransactionsListTo extends StatelessWidget {
  const TransactionsListTo({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return _TransactionsList(
      pagingController:
          BlocProvider.of<TransfersToCubit>(context).pagingController,
      isFrom: false,
    );
  }
}
