import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/cancel/domain/entities/cancel_atomic_swap_state.dart';

class CancelAtomicSwapBloc extends Cubit<CancelAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, CancelAtomicSwapParams> {
  CancelAtomicSwapBloc() : super(CancelAtomicSwapState.initial());

  @override
  // TODO: implement outerRouter
  StackRouter get outerRouter => throw UnimplementedError();

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
