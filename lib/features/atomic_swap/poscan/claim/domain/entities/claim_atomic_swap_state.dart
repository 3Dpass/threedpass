import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';

part 'claim_atomic_swap_state.g.dart';

@CopyWith()
class ClaimAtomicSwapState {
  const ClaimAtomicSwapState({
    required this.target,
  });

  ClaimAtomicSwapState.initial() : this(target: null);

  final KeyPairData? target;
}
