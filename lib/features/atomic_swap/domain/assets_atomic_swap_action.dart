import 'package:threedpass/features/atomic_swap/ui/create/domain/create_atomic_swap_action.dart';

class AssetsAtomicCreateSwapAction extends CreateAtomicSwapAction {
  final BigInt value;

  const AssetsAtomicCreateSwapAction({
    required this.value,
  });
}
