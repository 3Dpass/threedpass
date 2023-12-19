part of '../transactions_history_page.dart';

class _TransactionsList extends StatelessWidget {
  const _TransactionsList({
    required this.isFrom,
    required this.pagingController,
    final Key? key,
  }) : super(key: key);

  final PagingController<String, TransferItem> pagingController;
  final bool isFrom;

  @override
  Widget build(final BuildContext context) {
    final appService = BlocProvider.of<AppServiceLoaderCubit>(context).state;
    return PagedListView<String, TransferItem>.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      pagingController: pagingController,
      separatorBuilder: (final context, final index) => const Divider(),
      builderDelegate: PagedChildBuilderDelegate<TransferItem>(
        itemBuilder: (final context, final item, final index) =>
            TransactionItem(
          object: MapperTransferItemToUI.fromP3DTransfer(
            item: item,
            data: appService.networkStateData,
            isFrom: isFrom,
          ),
        ),
        noItemsFoundIndicatorBuilder: (final context) =>
            const NoTransferItemsFound(),
        firstPageErrorIndicatorBuilder: (final context) =>
            FirstPageExceptionIndicator(
          onTryAgain: pagingController.refresh,
        ),
      ),
    );
  }
}
