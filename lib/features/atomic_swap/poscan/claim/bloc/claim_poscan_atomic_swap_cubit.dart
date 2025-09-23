import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/chains/domain/entities/key_pair.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/entities/claim_poscan_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/bloc/atomic_swap_secret_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/usecases/claim_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class ClaimPoscanAtomicSwapCubit extends Cubit<void>
    with
        ExtrinsicShowLoadingMixin<void, ClaimPoscanAtomicSwapParams>,
        AtomicSwapSecretMixin {
  final ClaimPoscanAtomicSwap claimPoscanAtomicSwap;
  final PendingPoscanAtomicSwap pendingSwap;
  final KeyPair accountToSignExtrinsic;

  ClaimPoscanAtomicSwapCubit({
    required this.pendingSwap,
    required this.outerRouter,
    required this.accountToSignExtrinsic,
    required this.claimPoscanAtomicSwap,
  })  : safeCall = claimPoscanAtomicSwap.safeCall,
        super(null) {
    initSecretInput();
  }

  @override
  final StackRouter outerRouter;

  @override
  FutureOr<ClaimPoscanAtomicSwapParams> params(BuildContext context) {
    if (pendingSwap.hashProof.prefixValue != hashProofController.text) {
      throw Exception('Proofs do not match');
    }

    return ClaimPoscanAtomicSwapParams(
      account: accountToSignExtrinsic,
      password: passwordController.text,
      swap: pendingSwap,
      secret: secretInputController.text,
      updateStatus: () => updateStatus(context),
    );
  }

  @override
  final SafeUseCaseCall<void, ClaimPoscanAtomicSwapParams> safeCall;
}
