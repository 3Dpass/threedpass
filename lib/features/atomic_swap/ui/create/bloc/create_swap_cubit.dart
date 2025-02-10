import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/domain/atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/ui/create/domain/entities/create_atomic_swap_state.dart';

class CreateAtomicSwapCubit extends Cubit<CreateAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, AtomicCreateSwapParams> {
  CreateAtomicSwapCubit({required this.outerRouter})
      : super(const CreateAtomicSwapState.initial());

  final secretInputController = TextEditingController();
  final toAccountController = TextEditingController();

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

  void updateDeadline(DateTime newDeadline) {
    emit(
      state.copyWith(
        deadline: newDeadline,
      ),
    );
  }
}
