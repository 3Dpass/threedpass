import 'dart:ui';

import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/features/atomic_swap/create/domain/entities/pallet_atomic_swap_base_action.dart';

class ClaimAtomicSwapParams extends ExtrinsicUseCaseParams {
  final KeyPairData account;
  final String password;
  final String proof;
  final PalletAtomicSwapBalanceSwapAction action;

  @override
  final VoidCallback updateStatus;

  const ClaimAtomicSwapParams({
    required this.account,
    required this.password,
    required this.proof,
    required this.action,
    required this.updateStatus,
  });
}
