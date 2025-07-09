import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/core/utils/async_value.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

part 'create_atomic_swap_state.g.dart';

@CopyWith()
class CreateAtomicSwapState {
  const CreateAtomicSwapState({
    required this.target,
    required this.hashedProof,
    required this.assetId,
    required this.deadline,
  });

  CreateAtomicSwapState.initial()
      : this(
          target: null,
          hashedProof: AsyncValue.data(''),
          assetId: null,
          deadline: null,
        );

  final String? target;
  final AsyncValue<String> hashedProof;
  // final PalletAtomicSwapBaseAction? action;
  final DateTime? deadline;
  final AssetId? assetId;
}
