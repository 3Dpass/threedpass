part of '../pending_atomic_swap_page.dart';

class _PendingSwapsCardsList extends StatelessWidget {
  const _PendingSwapsCardsList();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PendingAtomicSwapCubit, PendingAtomicSwapState>(
      builder:
          (final BuildContext context, final PendingAtomicSwapState state) {
        return FastSeparatedListView(
          children: state.when(
            data: (final data) => ((data.pendingSwaps) +
                    (data.pendingSwaps) +
                    (data.pendingSwaps) +
                    (data.pendingSwaps))
                .map((final swap) => _PendingSwapCard(swap: swap))
                .toList(),
            error: (final error, final stackTrace) => [],
            loading: () => [],
          ),
          separator: const H8(),
          padding: const EdgeInsets.all(16),
        );
      },
    );
  }
}
