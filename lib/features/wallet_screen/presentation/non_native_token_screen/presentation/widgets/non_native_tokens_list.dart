part of '../non_native_token_screen.dart';

class _NonNativeTokensHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<>(builder: builder);
    final pagingController =
        BlocProvider.of<GetExtrinsicsCubit>(context).pagingController;
    return PagedListView<String, TransferNonNativeTokenAtom>.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      pagingController: pagingController,
      separatorBuilder: (final context, final index) => const Divider(),
      builderDelegate: PagedChildBuilderDelegate<TransferNonNativeTokenAtom>(
        itemBuilder: (final context, final item, final index) =>
            TransactionItem(
          object: MapperTransferNonNativeTokenAtom.fromNonNativeTransfer(
            item: item,
          ),
        ),
        noItemsFoundIndicatorBuilder: (final context) =>
            const NoTransferItemsFound(),
      ),
    );
  }
}
