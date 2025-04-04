import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/pending/domain/entities/pending_atomic_swap_state_data.dart';

class PendingAtomicSwapBloc extends Cubit<PendingAtomicSwapState> {
  PendingAtomicSwapBloc()
      : super(
          AsyncValue.loading(
            PendingAtomicSwapStateData(),
          ),
        );
}
