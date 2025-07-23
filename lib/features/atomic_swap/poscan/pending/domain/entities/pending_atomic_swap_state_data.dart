import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/basic/domain/enitites/basic_pending_atomic_swap_data.dart';

typedef PendingAtomicSwapState = AsyncValue<PendingAtomicSwapStateData>;

class PendingAtomicSwapStateData {
  final List<BasicPendingAtomicSwapData> pendingSwaps;

  const PendingAtomicSwapStateData({
    required this.pendingSwaps,
  });
}
