import 'package:copy_with_extension/copy_with_extension.dart';

part 'create_atomic_swap_state.g.dart';

@CopyWith()
class CreateAtomicSwapState {
  const CreateAtomicSwapState({
    required this.target,
    required this.action,
    required this.deadline,
  });

  const CreateAtomicSwapState.initial()
      : this(
          target: null,
          action: null,
          deadline: null,
        );

  final String? target;
  final BigInt? action;
  final DateTime? deadline;
}
