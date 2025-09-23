import 'dart:ui';

import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/features/chains/domain/entities/key_pair.dart';
// ignore: unused_import
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/pallet_atomic_swap_base_action.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class ClaimPoscanAtomicSwapParams extends ExtrinsicUseCaseParams {
  final KeyPair account;
  final String password;
  final PendingPoscanAtomicSwap swap;
  final String secret;

  @override
  final VoidCallback updateStatus;

  const ClaimPoscanAtomicSwapParams({
    required this.account,
    required this.password,
    required this.updateStatus,
    required this.swap,
    required this.secret,
  });
}
