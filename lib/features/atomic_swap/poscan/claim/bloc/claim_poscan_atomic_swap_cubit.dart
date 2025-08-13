import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/entities/claim_poscan_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/domain/usecases/claim_poscan_atomic_swap.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class ClaimPoscanAtomicSwapCubit extends Cubit<void>
    with ExtrinsicShowLoadingMixin<void, ClaimPoscanAtomicSwapParams> {
  final ClaimPoscanAtomicSwap claimPoscanAtomicSwap;
  final PendingPoscanAtomicSwap pendingSwap;
  final KeyPair accountToSignExtrinsic;

  ClaimPoscanAtomicSwapCubit({
    required this.pendingSwap,
    required this.outerRouter,
    required this.accountToSignExtrinsic,
    required this.claimPoscanAtomicSwap,
  })  : safeCall = claimPoscanAtomicSwap.safeCall,
        super(null);

  final TextEditingController secretController = TextEditingController();

  @override
  final StackRouter outerRouter;

  @override
  FutureOr<ClaimPoscanAtomicSwapParams> params(BuildContext context) {
    return ClaimPoscanAtomicSwapParams(
      account: accountToSignExtrinsic,
      password: passwordController.text,
      swap: pendingSwap,
      secret: secretController.text,
      updateStatus: () => updateStatus(context),
    );
  }

  @override
  final SafeUseCaseCall<void, ClaimPoscanAtomicSwapParams> safeCall;
}
