import 'dart:convert';

import 'package:polkawallet_sdk/polkawallet_sdk.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/atomic_swap/poscan/common/domain/entities/raw_pending_poscan_atomic_swap_data.dart';
import 'package:threedpass/features/atomic_swap/poscan/create/domain/entities/create_atomic_swap_params.dart';

abstract class PoscanAtomicSwapRepository {
  const PoscanAtomicSwapRepository();

  Future<void> create({
    required final CreateAtomicSwapParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });

  Future<List<RawPendingPoscanAtomicSwapData>> pendingSwaps({
    required String address,
  });
}

class PoscanAtomicSwapRepositoryImpl implements PoscanAtomicSwapRepository {
  const PoscanAtomicSwapRepositoryImpl({
    required this.callSignExtrinsicUtil,
    required this.polkawalletSDK,
  });

  final CallSignExtrinsicUtil callSignExtrinsicUtil;
  final WalletSDK polkawalletSDK;

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

  @override
  Future<List<RawPendingPoscanAtomicSwapData>> pendingSwaps({
    required String address,
  }) async {
    final dynamic res = await polkawalletSDK.api.universal.callNoSign(
      calls: ['query', 'poscanAtomicSwap', 'pendingSwaps', 'entries'],
      args: '["$address"]',
      sendNullAsArg: false,
    );

    logger.t(res);

    return res
        .map((final e) => RawPendingPoscanAtomicSwapData.fromRaw(e))
        .toList();
  }
}
