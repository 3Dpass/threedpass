import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/utils/async_value.dart';

part 'claim_atomic_swap_state.g.dart';

@CopyWith()
class ClaimAtomicSwapState {
  const ClaimAtomicSwapState({
    required this.target,
    required this.hashedProof,
  });

  ClaimAtomicSwapState.initial()
      : this(
          target: null,
          hashedProof: AsyncValue.data(''),
        );

  final KeyPairData? target;
  final AsyncValue<String> hashedProof;
}
