import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/features/atomic_swap/ui/create/domain/create_atomic_swap_action.dart';

class CreateAtomicSwapParams {
  final KeyPairData account;
  final KeyPairData target;
  final String secret;
  final CreateAtomicSwapAction action;
  final int duration;

  const CreateAtomicSwapParams({
    required this.account,
    required this.target,
    required this.secret,
    required this.action,
    required this.duration,
  });
}
