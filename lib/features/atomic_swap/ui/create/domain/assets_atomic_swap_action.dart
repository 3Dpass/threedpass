import 'package:threedpass/features/atomic_swap/ui/create/domain/create_atomic_swap_action.dart';

class ValueCreateAtomicSwapAction extends CreateAtomicSwapAction {
  final BigInt value;

  const ValueCreateAtomicSwapAction({
    required this.value,
  });
}
