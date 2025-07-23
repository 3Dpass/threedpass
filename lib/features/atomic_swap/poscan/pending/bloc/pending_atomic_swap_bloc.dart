import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/chains/bloc/current_account_cubit.dart';
import 'package:threedpass/core/chains/domain/entities/current_account.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/entities/pending_atomic_swap_state_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/pending/domain/usecases/get_pending_poscan_atomic_swap.dart';

class PendingAtomicSwapBloc extends Cubit<PendingAtomicSwapState>
    with SubOnAccChange {
  PendingAtomicSwapBloc({
    required this.getPendingPoscanAtomicSwap,
  }) : super(
          AsyncValue.initial(),
        ) {
    subscribeOnAccountChange(onAccSwitched);
  }

  final GetPendingPoscanAtomicSwap getPendingPoscanAtomicSwap;

  Future<void> onAccSwitched(CurrentAccount? acc) async {
    if (acc != null) {
      final pendingSwaps =
          await getPendingPoscanAtomicSwap(acc.nativeP3D.address);
      emit(
        AsyncValue.data(
          PendingAtomicSwapStateData(
            pendingSwaps: pendingSwaps,
          ),
        ),
      );
    } else {
      emit(AsyncValue.loading());
    }
  }
}
