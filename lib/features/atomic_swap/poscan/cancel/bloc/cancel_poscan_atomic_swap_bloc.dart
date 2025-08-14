import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

// TODO rename to cubit
class CancelPoscanAtomicSwapBloc extends Cubit<void>
    with ExtrinsicShowLoadingMixin<void, CancelPoscanAtomicSwapParams> {
  final PendingPoscanAtomicSwap pendingSwap;
  final KeyPair accountToSignExtrinsic;

  CancelPoscanAtomicSwapBloc({
    required this.pendingSwap,
    required this.outerRouter,
    required this.accountToSignExtrinsic,
  }) : super(null);

  @override
  final StackRouter outerRouter;

  @override
  FutureOr<CancelPoscanAtomicSwapParams> params(BuildContext context) {
    return CancelPoscanAtomicSwapParams(
      account: accountToSignExtrinsic,
      password: passwordController.text,
      swap: pendingSwap,
      updateStatus: () => updateStatus(context),
    );
  }

  @override
  SafeUseCaseCall<void, CancelPoscanAtomicSwapParams> get safeCall =>
      throw UnimplementedError();
}
