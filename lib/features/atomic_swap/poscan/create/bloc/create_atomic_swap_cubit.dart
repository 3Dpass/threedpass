import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/polkawallet/utils/datetime_from_block_number.dart';
import 'package:threedpass/core/polkawallet/utils/key_pair_data_fabric.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/core/utils/extrinsic_show_loading_mixin.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_params.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_state.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/calc_hashed_proof.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/usecases/create_atomic_swap.dart';

class CreateAtomicSwapCubit extends Cubit<CreateAtomicSwapState>
    with ExtrinsicShowLoadingMixin<void, CreateAtomicSwapParams> {
  CreateAtomicSwapCubit({
    required this.outerRouter,
    required this.calcHashedProof,
    required this.createAtomicSwap,
    required this.appServiceLoaderCubit,
  }) : super(CreateAtomicSwapState.initial());

  final secretInputController = TextEditingController();
  final toAccountController = TextEditingController();
  final CalcHashedProof calcHashedProof;
  final CreateAtomicSwap createAtomicSwap;
  final AppServiceLoaderCubit appServiceLoaderCubit;

  @override
  final StackRouter outerRouter;

  @override
  SafeUseCaseCall<void, CreateAtomicSwapParams> get safeCall =>
      createAtomicSwap.safeCall;

  @override
  FutureOr<CreateAtomicSwapParams> params(BuildContext context) {
    if (state.action == null) {
      throw Exception('Action is null');
    }
    if (state.deadline == null) {
      throw Exception('Deadline is null');
    }
    if (!state.hashedProof.hasValue) {
      throw Exception('Hashed proof is null');
    }

    return CreateAtomicSwapParams(
      account: appServiceLoaderCubit.state.keyring.current,
      password: passwordController.text,
      target: KeyPairDataFabric.fromJson(
        address: toAccountController.text,
        name: null,
      ), // TODO check if address correct, get name from contacts
      secret: state.hashedProof.value!,
      action: state.action!,
      updateStatus: () => updateStatus(context),
      duration: blockNumberFromDateTime(state.deadline!),
    );
  }

  void updateDeadline(DateTime newDeadline) {
    emit(
      state.copyWith(
        deadline: newDeadline,
      ),
    );
  }

  Future<void> updateSecret() async {
    emit(state.copyWith(hashedProof: AsyncValue.loading()));
    final hashedProof = await calcHashedProof.call(secretInputController.text);
    emit(state.copyWith(hashedProof: AsyncValue.data(hashedProof)));
  }
}
