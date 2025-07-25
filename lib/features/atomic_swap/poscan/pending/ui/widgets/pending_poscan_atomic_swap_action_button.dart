part of 'pending_swap_card.dart';

class _PendingPoscanAtomicSwapActionButton extends StatelessWidget {
  const _PendingPoscanAtomicSwapActionButton({
    required this.swap,
    required this.currentAddress,
  });

  final PendingPoscanAtomicSwap swap;
  final Address currentAddress;

  @override
  Widget build(final BuildContext context) {
    if (currentAddress == swap.from) {
      return D3pElevatedButton(
        text: 'Cancel swap',
        onPressed: () {},
        isInfinityWidth: false,
        isDangerColor: true,
      );
    }
    if (currentAddress == swap.to) {
      return D3pElevatedButton(
        text: 'Claim swap',
        onPressed: () {},
        isInfinityWidth: false,
      );
    }
    throw Exception('Current address is not in the swap');
  }
}
