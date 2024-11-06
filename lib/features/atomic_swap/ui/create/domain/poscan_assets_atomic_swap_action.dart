import 'package:threedpass/features/atomic_swap/ui/create/domain/create_atomic_swap_action.dart';

class PoscanAssetsCreateAtomicSwapAction extends CreateAtomicSwapAction {
  final int assetId;
  final BigInt value;

  const PoscanAssetsCreateAtomicSwapAction({
    required this.assetId,
    required this.value,
  });
}
