import 'dart:ui';

import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class CancelPoscanAtomicSwapParams extends ExtrinsicUseCaseParams {
  final KeyPair account;
  final String password;
  final PendingPoscanAtomicSwap swap;

  @override
  final VoidCallback updateStatus;

  const CancelPoscanAtomicSwapParams({
    required this.account,
    required this.password,
    required this.swap,
    required this.updateStatus,
  });
}
