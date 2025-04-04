import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/atomic_swap/create/domain/entities/pallet_atomic_swap_base_action.dart';

part 'create_atomic_swap_state.g.dart';

@CopyWith()
class CreateAtomicSwapState {
  const CreateAtomicSwapState({
    required this.target,
    required this.hashedProof,
    required this.action,
    required this.deadline,
  });

  CreateAtomicSwapState.initial()
      : this(
          target: null,
          hashedProof: AsyncValue.data(''),
          action: null,
          deadline: null,
        );

  final String? target;
  final AsyncValue<String> hashedProof;
  final PalletAtomicSwapBaseAction? action;
  final DateTime? deadline;
}
