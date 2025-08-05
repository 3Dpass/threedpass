import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/core/chains/domain/entities/key_pair.dart';

part 'cancel_atomic_swap_state.g.dart';

@CopyWith()
class CancelAtomicSwapState {
  const CancelAtomicSwapState({
    required this.target,
  });

  final KeyPair? target;
}
