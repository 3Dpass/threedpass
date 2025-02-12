import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/ui/create/domain/entities/create_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/ui/create/domain/entities/create_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/ui/create/domain/usecases/calc_hashed_proof.dart';

class CreateAtomicSwapCubit extends Cubit<CreateAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, CreateAtomicSwapParams> {
  CreateAtomicSwapCubit({
    required this.outerRouter,
    required this.calcHashedProof,
  }) : super(const CreateAtomicSwapState.initial());

  final secretInputController = TextEditingController();
  final toAccountController = TextEditingController();
  final CalcHashedProof calcHashedProof;

  @override
  final StackRouter outerRouter;

  @override
  // TODO: implement safeCall
  SafeUseCaseCall<void, dynamic> get safeCall => throw UnimplementedError();

  @override
  FutureOr<CreateAtomicSwapParams> params(BuildContext context) {
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

  Future<void> updateSecret() async {
    final hashedProof = await calcHashedProof.call(secretInputController.text);
    emit(state.copyWith(hashedProof: hashedProof));
  }
}
