import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/claim/domain/entities/claim_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

class ClaimPoscanAtomicSwapBloc extends Cubit<ClaimAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, CancelAtomicSwapParams> {
  final PendingPoscanAtomicSwap pendingSwap;

  ClaimPoscanAtomicSwapBloc({
    required this.pendingSwap,
    required this.outerRouter,
  }) : super(ClaimAtomicSwapState.initial());

  @override
  final StackRouter outerRouter;

  void onAccountSelected(final KeyPairData account) {
    emit(
      state.copyWith(
        target: account,
      ),
    );
  }

  @override
  FutureOr<CancelAtomicSwapParams> params(BuildContext context) {
    // TODO: implement params
    throw UnimplementedError();
  }

  @override
  // TODO: implement safeCall
  SafeUseCaseCall<void, CancelAtomicSwapParams> get safeCall =>
      throw UnimplementedError();
}
