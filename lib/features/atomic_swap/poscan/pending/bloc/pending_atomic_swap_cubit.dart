import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_atomic_swap_state_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/usecases/get_pending_poscan_atomic_swap.dart';

class PendingAtomicSwapCubit extends Cubit<PendingAtomicSwapState> {
  PendingAtomicSwapCubit({
    required this.getPendingPoscanAtomicSwap,
  }) : super(AsyncValue.loading()) {
    getValueAndSubOnAccChange(onAccSwitched);
  }

  final GetPendingPoscanAtomicSwap getPendingPoscanAtomicSwap;

  Future<void> _setLoading() async => emit(AsyncValue.loading());

  Future<void> _setError(final Object e, final StackTrace st) async =>
      emit(AsyncValue.error(e, st));

  Future<void> _setData(final CurrentAccount acc) async =>
      getPendingPoscanAtomicSwap.safeCall(
        params: acc.nativeP3D.address,
        onError: _setError,
        onSuccess: (final pendingSwaps) => emit(
          AsyncValue.data(
            PendingAtomicSwapStateData(
              pendingSwaps: pendingSwaps,
            ),
          ),
        ),
      );

  Future<void> onAccSwitched(CurrentAccountState acc) =>
      acc.when(data: _setData, error: _setError, loading: _setLoading);
}
