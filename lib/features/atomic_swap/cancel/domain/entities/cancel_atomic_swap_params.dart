import 'dart:ui';

import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:threedpass/core/call_extrinsic_usecase.dart';

class CancelAtomicSwapParams extends ExtrinsicUseCaseParams {
  final KeyPairData account;
  final String password;
  final KeyPairData target;
  final String hashedProof;

  @override
  final VoidCallback updateStatus;

  const CancelAtomicSwapParams({
    required this.account,
    required this.password,
    required this.target,
    required this.hashedProof,
    required this.updateStatus,
  });
}
