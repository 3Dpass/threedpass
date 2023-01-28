part of '../transactions_history_page.dart';

class _TransactionsList extends StatelessWidget {
  const _TransactionsList({
    required this.isFrom,
    required this.pagingController,
    final Key? key,
  }) : super(key: key);

  final PagingController<String, GGetTransfersData_getTransfers_objects>
      pagingController;
  final bool isFrom;

  @override
  Widget build(final BuildContext context) {
    return PagedListView<String,
        GGetTransfersData_getTransfers_objects>.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      pagingController: pagingController,
      physics: Platform.isIOS
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      separatorBuilder: (final context, final index) => const Divider(),
      builderDelegate:
          PagedChildBuilderDelegate<GGetTransfersData_getTransfers_objects>(
        itemBuilder: (final context, final item, final index) =>
            TransactionItem(
          object: item,
          colorFromSecondary: isFrom,
          colorToSecondary: !isFrom,
        ),
        noItemsFoundIndicatorBuilder: (final context) => const _NoItemsFound(),
      ),
    );
  }
}
