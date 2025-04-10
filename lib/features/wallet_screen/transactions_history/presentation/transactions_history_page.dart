import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:threedpass/core/widgets/d3p_scaffold.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/bloc/get_transfers_cubit.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/presentation/widgets/first_page_exception_indicator.dart';
import 'package:threedpass/features/wallet_screen/transfer_page/domain/entities/transfer_history_ui.dart';
import 'package:threedpass/features/wallet_screen/widgets/no_transfer_items_found.dart';
import 'package:threedpass/features/wallet_screen/widgets/transaction_item.dart';

class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final bloc = BlocProvider.of<GetTransfersCubit>(context);
    return D3pScaffold(
      appBarTitle: 'transfers_history_title',
      body: PagedListView<int, TransferHistoryUI>.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        pagingController: bloc.pagingController,
        separatorBuilder: (final context, final index) => const Divider(),
        builderDelegate: PagedChildBuilderDelegate<TransferHistoryUI>(
          itemBuilder: (final context, final item, final index) =>
              TransactionItem(object: item),
          noItemsFoundIndicatorBuilder: (final context) =>
              const NoTransferItemsFound(),
          firstPageErrorIndicatorBuilder: (final context) =>
              FirstPageExceptionIndicator(
            onTryAgain: bloc.pagingController.refresh,
          ),
        ),
      ),
    );
  }
}
