part of '../pending_atomic_swap_page.dart';

class _PendingSwapsCardsList extends StatelessWidget {
  const _PendingSwapsCardsList();

  @override
  Widget build(final BuildContext context) => WhenAddress(
        builder: (final CurrentAccount account) =>
            BlocBuilder<PendingAtomicSwapCubit, PendingAtomicSwapState>(
          builder: (final BuildContext context,
                  final PendingAtomicSwapState state) =>
              state
                  .when<List<PendingPoscanAtomicSwap>>(
                    data: (final data) =>
                        data.relatedToAcc(account.nativeP3D.address),
                    error: (final error, final stackTrace) => [],
                    loading: () => [],
                  )
                  .whenNotEmpty<Widget>(
                    empty: () => Center(
                      child: PH16(
                        child: Text('No pending swaps for this account'.tr()),
                      ),
                    ),
                    notEmpty: (final List<PendingPoscanAtomicSwap> swaps) =>
                        Column(
                      spacing: 16,
                      children: swaps
                          .map((final swap) => PendingSwapCard(swap: swap))
                          .toList(),
                    ),
                  ),
        ),
      );
}
