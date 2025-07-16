import 'dart:convert';

import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_params.dart';

abstract class AtomicSwapRepository {
  const AtomicSwapRepository();

  Future<void> create({
    required final CreateAtomicSwapParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
}

class AtomicSwapRepositoryImpl implements AtomicSwapRepository {
  const AtomicSwapRepositoryImpl({
    required this.callSignExtrinsicUtil,
  });

  final CallSignExtrinsicUtil callSignExtrinsicUtil;

  @override
  Future<void> create({
    required final CreateAtomicSwapParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final args = [
      params.target.address,
      params.hashedProof,
      {
        'assetId': params.action.assetId,
        'value': BigIntJsonHelper.encode(params.action.value),
      },
      params.duration,
    ];

    final midEncoding = const JsonEncoder().convert(args);
    final argsEncoded = BigIntJsonHelper.replace(midEncoding);

    logger.t(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAtomicSwap', 'createSwap'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }
}
