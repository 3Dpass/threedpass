import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_poscan_atomic_swap.dart';

// TODO rename to cubit
class CancelPoscanAtomicSwapBloc extends Cubit<CancelAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, CancelAtomicSwapParams> {
  final PendingPoscanAtomicSwap pendingSwap;
  final CurrentAccountCubit currentAccountCubit;

  CancelPoscanAtomicSwapBloc({
    required this.pendingSwap,
    required this.outerRouter,
    required this.currentAccountCubit,
  }) : super(
          CancelAtomicSwapState(
            target: currentAccountCubit.state.value?.nativeP3D,
          ),
        );

  void onAccountSelected(final KeyPair? account) {
    emit(
      state.copyWith(
        target: account,
      ),
    );
  }

  @override
  final StackRouter outerRouter;

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
