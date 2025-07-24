part of '../pending_atomic_swap_page.dart';

class _PendingSwapCard extends StatelessWidget {
  const _PendingSwapCard({
    required this.swap,
  });

  final PendingPoscanAtomicSwap swap;

  @override
  Widget build(final BuildContext context) {
    return D3pCard(
      child: Column(
        children: [
          AccountIdentity(
            address: swap.from,
            prefix: 'From:',
            colorSecondary: false,
          ),
          const H4(),
          AccountIdentity(
            address: swap.to,
            prefix: 'To:',
            colorSecondary: true,
          ),
        ],
      ),
    );
  }
}
