import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_atomic_swap_state_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/usecases/get_pending_poscan_atomic_swap.dart';

class PendingAtomicSwapCubit extends Cubit<PendingAtomicSwapState> {
  PendingAtomicSwapCubit({
    required this.getPendingPoscanAtomicSwap,
  }) : super(AsyncValue.loading());

  final GetPendingPoscanAtomicSwap getPendingPoscanAtomicSwap;

  Future<void> _setError(final Object e, final StackTrace st) async =>
      emit(AsyncValue.error(e, st));

  void init() {
    emit(AsyncValue.loading());
    getPendingPoscanAtomicSwap.safeCall(
      params: null,
      onError: _setError,
      onSuccess: (final pendingSwaps) => emit(
        AsyncValue.data(
          PendingAtomicSwapStateData(
            pendingSwaps: pendingSwaps,
          ),
        ),
      ),
    );
  }
}
