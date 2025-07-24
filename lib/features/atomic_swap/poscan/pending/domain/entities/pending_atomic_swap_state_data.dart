import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

typedef PendingAtomicSwapState = AsyncValue<PendingAtomicSwapStateData>;

class PendingAtomicSwapStateData {
  final List<PendingPoscanAtomicSwap> pendingSwaps;

  const PendingAtomicSwapStateData({
    required this.pendingSwaps,
  });
}
