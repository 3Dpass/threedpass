part of '../pending_atomic_swap_page.dart';

class _PendingSwapsCardsList extends StatelessWidget {
  const _PendingSwapsCardsList();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<PendingAtomicSwapCubit, PendingAtomicSwapState>(
      builder:
          (final BuildContext context, final PendingAtomicSwapState state) {
        return Column(
          spacing: 16,
          children: state.when(
            data: (final data) => data.pendingSwaps
                .map((final swap) => PendingSwapCard(swap: swap))
                .toList(),
            error: (final error, final stackTrace) => [],
            loading: () => [],
          ),
        );
      },
    );
  }
}
