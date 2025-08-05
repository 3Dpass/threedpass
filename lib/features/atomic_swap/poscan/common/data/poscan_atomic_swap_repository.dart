import 'dart:convert';

import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
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

  Future<List<RawPendingPoscanAtomicSwapData>> pendingSwaps();
}

class PoscanAtomicSwapRepositoryImpl implements PoscanAtomicSwapRepository {
  const PoscanAtomicSwapRepositoryImpl({
    required this.callSignExtrinsicUtil,
    required this.appServiceLoaderCubit,
  });

  final CallSignExtrinsicUtil callSignExtrinsicUtil;
  final AppServiceLoaderCubit appServiceLoaderCubit;

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
  Future<List<RawPendingPoscanAtomicSwapData>> pendingSwaps() async {
    final dynamic res =
        await appServiceLoaderCubit.state.plugin.sdk.api.universal.callNoSign(
      calls: ['query', 'poscanAtomicSwap', 'pendingSwaps', 'entries'],
      args: null, //'["$address"]',
      sendNullAsArg: false,
    );

    logger.t('pendingSwaps: $res, res type: ${res.runtimeType}');

    return res
        .map<RawPendingPoscanAtomicSwapData>(
          (final e) => RawPendingPoscanAtomicSwapData.fromRaw(e),
        )
        .toList();

//     final String getBalanceFunc = """
// var entries = await api.query.poscanAtomicSwap.pendingSwaps.entries();
// var result = [];

// entries.forEach(([keys, value]) => {
//   const [targetAccount, hashedProof, lol, kek, azaz] = keys;
//   const pendingSwap = value.unwrap ? value.unwrap() : value;

//   result.push({
//     targetAccount: targetAccount,
//     hashedProof: hashedProof.toString(),
//     lol: lol.toString(),
//     kek: kek.toString(),
//     azaz: azaz.toString(),
//     source: pendingSwap.source.toString(),
//     action: {
//       assetId: pendingSwap.action.assetId ? pendingSwap.action.assetId.toNumber() : null,
//       value: pendingSwap.action.value ? pendingSwap.action.value.toString() : null
//     },
//     endBlock: pendingSwap.endBlock.toNumber()
//   });
// });

// return result;
// """;
//     final dynamic response = await appServiceLoaderCubit
//         .state.plugin.sdk.webView!.webInstance!.webViewController
//         .callAsyncJavaScript(
//       functionBody: getBalanceFunc,
//     );

//     print(response);
//     return [];
  }
}
