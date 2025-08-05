import 'package:threedpass/features/atomic_swap/basic/domain/enitites/basic_pending_atomic_swap_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/domain/entities/raw_pending_poscan_atomic_swap_data.dart';

final class PendingPoscanAtomicSwap extends BasicPendingAtomicSwapData {
  final RawPendingPoscanAtomicSwapAction action;

  const PendingPoscanAtomicSwap({
    required super.from,
    required super.to,
    required super.hashProof,
    required super.deadline,
    required this.action,
  });
}
