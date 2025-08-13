part of '../pending_atomic_swap_page.dart';

class _PendingSwapsCardsList extends StatelessWidget {
  const _PendingSwapsCardsList();

  @override
  Widget build(final BuildContext context) => WhenAddress(
        builder: (final CurrentAccount account) =>
            WhenValue<PendingAtomicSwapCubit, PendingAtomicSwapStateData>(
          builder: (PendingAtomicSwapStateData state) => state
              .relatedToAcc(account.nativeP3D.address)
              .whenNotEmpty<Widget>(
                empty: () => Center(
                  child: PH16(
                    child: Text('no_pending_swaps_available'.tr()),
                  ),
                ),
                notEmpty: (final List<PendingPoscanAtomicSwap> swaps) => Column(
                  spacing: 16,
                  children: swaps
                      .map((final swap) => PendingSwapCard(swap: swap))
                      .toList(),
                ),
              ),
        ),
      );
}
