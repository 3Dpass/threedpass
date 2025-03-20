import 'dart:ui';

import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/call_extrinsic_usecase.dart';
import 'package:threedpass/features/atomic_swap/create/domain/entities/pallet_atomic_swap_base_action.dart';

class CreateAtomicSwapParams extends ExtrinsicUseCaseParams {
  final KeyPairData account;
  final String password;
  final KeyPairData target;
  final String secret;
  final PalletAtomicSwapBaseAction action;
  final int duration;
  @override
  final VoidCallback updateStatus;

  const CreateAtomicSwapParams({
    required this.account,
    required this.password,
    required this.target,
    required this.secret,
    required this.action,
    required this.duration,
    required this.updateStatus,
  });
}
