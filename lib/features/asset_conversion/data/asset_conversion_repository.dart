import 'dart:convert';

import 'package:polkawallet_sdk/polkawallet_sdk.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/utils/basic_polkadot_js_call.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/features/asset_conversion/data/pool_asset_field_to_js_arg.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/lp_balance.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/raw_pool_reserve.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';

abstract class AssetConversionRepository {
  const AssetConversionRepository();

  Future<Either<Failure, LPBalance?>> lpTokens({
    required final int lpTokenId,
    required final String address,
  });
  Future<RawPoolReserve?> poolReserve(final BasicPoolEntity basicPool);
  Future<Iterable<BasicPoolEntity>> poolsBasic();

  Future<Either<Failure, void>> createPool({
    required final CreatePoolParams params,
    required final void Function(String) msgIdCallback,
  });
  Future<Either<Failure, void>> addLiquidity({
    required final AddLiquidityParams params,
    required final void Function(String) msgIdCallback,
  });
  Future<Either<Failure, void>> removeLiquidity({
    required final RemoveLiquidityParams params,
    required final void Function(String) msgIdCallback,
  });
}

class AssetConversionRepositoryImpl extends AssetConversionRepository {
  final WalletSDK polkawalletSdk;
  final CallSignExtrinsicUtil callSignExtrinsicUtil;

  const AssetConversionRepositoryImpl({
    required this.polkawalletSdk,
    required this.callSignExtrinsicUtil,
  });

  static String assetFieldToJS(final PoolAssetField assetField) {
    if (assetField.isNative) {
      return 'pools.createNativeTokenId(api);';
    } else {
      return 'pools.createAssetTokenId(api, "${assetField.assetId!}");';
    }
  }

  @override
  Future<Either<Failure, LPBalance?>> lpTokens({
    required final int lpTokenId,
    required final String address,
  }) async {
    try {
      final dynamic res = await polkawalletSdk.api.universal.callNoSign(
        calls: ['query', 'poscanPoolAssets', 'account'],
        args: '[$lpTokenId, "$address"]',
        sendNullAsArg: false,
      );

      print(res);
      if (res == null) {
        return const Either.right(null);
      } else {
        return Either.right(LPBalance.fromJson(res as Map<String, dynamic>));
      }
    } on Object catch (e) {
      logE(e.toString());
      return Either.left(NoDataFailure(e.toString()));
    }
  }

  @override
  Future<RawPoolReserve?> poolReserve(final BasicPoolEntity basicPool) async {
    final String getPoolReserversFunc = """
let m1 = ${assetFieldToJS(basicPool.firstAsset)}
let m2 = ${assetFieldToJS(basicPool.secondAsset)}

let res = await pools.getPoolReserves(api, m1, m2);

return res;
""";

    print('CODE ' + getPoolReserversFunc);

    final dynamic res = await basicJSCall(
      getPoolReserversFunc,
      polkawalletSdk.webView!.webInstance!.webViewController,
    );

    print(res);
    // [10,530,015,434, 9,509,085,784]

    if (res == null) {
      return null;
    }

    final resT = RawPoolReserve.fromJson(res as List<dynamic>);
    return resT;
  }

  @override
  Future<Iterable<BasicPoolEntity>> poolsBasic() async {
    const String getPoolsFunc = """
var p = async () => {
  const pools = await api.query.assetConversion.pools.entries();
    return pools.map(([key, value]) => [key.args?.[0].toHuman(), value.toHuman()]);
};
var res = await p();
return res;
""";

    final dynamic res = await basicJSCall(
      getPoolsFunc,
      polkawalletSdk.webView!.webInstance!.webViewController,
    );
    // [[[Native, {Asset: 4}], {lpToken: 0}]]
    print(res);

    res as List<dynamic>;
    final resT = res
        .map((final dynamic e) => BasicPoolEntity.fromJson(e as List<dynamic>));
    // poolReservers(resT.first);
    // lpTokens(
    //   lpTokenId: 0,
    //   address: 'd1CMCgypZvZJFRRXqo8LKj1FgqrHzKT6TzjYMKzgUUS9VZRQr',
    // );
    // lpTokens(
    //   lpTokenId: 0,
    //   address: 'd1EHg63RUs3L74N1TeJEkZGBRRd1LfPHknZSPrSu373h5kGVa',
    // );
    return resT;
  }

  @override
  Future<Either<Failure, void>> createPool({
    required final CreatePoolParams params,
    required final void Function(String p1) msgIdCallback,
  }) async {
    final args = [
      params.asset1.toJSArg(),
      params.asset2.toJSArg(),
    ];
    final argsEncoded = const JsonEncoder().convert(args);
    // final argsEncoded = BigIntJsonHelper.replace(argsPreEncoded);
    print(argsEncoded);

    // return Either.right(null);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'assetConversion', 'createPool'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<Either<Failure, void>> addLiquidity({
    required final AddLiquidityParams params,
    required final void Function(String p1) msgIdCallback,
  }) async {
    final args = [
      params.asset1.toJSArg(),
      params.asset2.toJSArg(),
      BigIntJsonHelper.encode(params.amount1Desired.toBigInt()),
      BigIntJsonHelper.encode(params.amount2Desired.toBigInt()),
      BigIntJsonHelper.encode(params.amount1Min.toBigInt()),
      BigIntJsonHelper.encode(params.amount2Min.toBigInt()),
      params.account.pubKey,
    ];

    String argsEncoded = '';
    argsEncoded = const JsonEncoder().convert(args);
    argsEncoded = BigIntJsonHelper.replace(argsEncoded);

    print(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'assetConversion', 'addLiquidity'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<Either<Failure, void>> removeLiquidity({
    required final RemoveLiquidityParams params,
    required final void Function(String p1) msgIdCallback,
  }) {
    final args = [
      params.asset1.toJSArg(),
      params.asset2.toJSArg(),
      BigIntJsonHelper.encode(params.lpTokenBurn),
      BigIntJsonHelper.encode(params.amount1Min),
      BigIntJsonHelper.encode(params.amount2Min),
      params.account.pubKey,
    ];

    String argsEncoded = '';
    argsEncoded = const JsonEncoder().convert(args);
    argsEncoded = BigIntJsonHelper.replace(argsEncoded);

    print(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'assetConversion', 'removeLiquidity'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }
}
