import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/domain/atomic_swap_params.dart';

class CreateSwapState {
  const CreateSwapState();
}

class CreateAtomicSwapCubit extends Cubit<CreateSwapState>
    with ExtrinsicShowLoadingMixin<void, AtomicCreateSwapParams> {
  CreateAtomicSwapCubit({required this.outerRouter})
      : super(
          const CreateSwapState(),
        );

  @override
  final StackRouter outerRouter;

  @override
  // TODO: implement safeCall
  SafeUseCaseCall<void, dynamic> get safeCall => throw UnimplementedError();

  @override
  FutureOr<AtomicCreateSwapParams> params(BuildContext context) {
    // TODO: implement params
    throw UnimplementedError();
  }

  final secretInputController = TextEditingController();
   final toAccountController = TextEditingController();
}
