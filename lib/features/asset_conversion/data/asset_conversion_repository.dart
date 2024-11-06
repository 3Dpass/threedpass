import 'dart:convert';

import 'package:polkawallet_sdk/polkawallet_sdk.dart';
import 'package:threedpass/core/errors/wrong_type_fauilure.dart';

import 'package:threedpass/core/polkawallet/utils/basic_polkadot_js_call.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/data/pool_asset_field_to_js_arg.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/lp_balance.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/raw_pool_reserve.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/add_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/create_pool.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/remove_liquidity.dart';
import 'package:threedpass/features/asset_conversion/domain/use_cases/swap_assets.dart';

abstract class AssetConversionRepository {
  const AssetConversionRepository();

  Future<String> getAssetTokenFromNativeToken({
    required final int assetTokenId,
    required final BigInt nativeTokenValue,
  });
  Future<String> getNativeTokenFromAssetToken({
    required final int assetTokenId,
    required final BigInt assetTokenValue,
  });
  Future<String> getAssetTokenAFromAssetTokenB({
    required final int assetToken1Id,
    required final int assetToken2Id,
    required final BigInt assetToken2Value,
  });
  Future<String> getAssetTokenBFromAssetTokenA({
    required final int assetToken1Id,
    required final int assetToken2Id,
    required final BigInt assetToken1Value,
  });
  Future<int> existentialDeposit();
  Future<BigInt?> lpTokens({
    required final int lpTokenId,
    required final String address,
  });
  Future<BigInt> totalLPTokensSupply({
    required final int lpTokenId,
  });
  Future<RawPoolReserve?> poolReserve(final BasicPoolEntity basicPool);
  Future<List<BasicPoolEntity>> poolsBasic();

  Future<void> createPool({
    required final CreatePoolParams params,
    required final void Function(String) msgIdCallback,
  });
  Future<void> addLiquidity({
    required final AddLiquidityParams params,
    required final void Function(String) msgIdCallback,
  });
  Future<void> removeLiquidity({
    required final RemoveLiquidityParams params,
    required final void Function(String) msgIdCallback,
  });
  Future<void> swapAssets({
    required final SwapAssetsParams params,
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
  Future<BigInt?> lpTokens({
    required final int lpTokenId,
    required final String address,
  }) async {
    final dynamic res = await polkawalletSdk.api.universal.callNoSign(
      calls: ['query', 'poscanPoolAssets', 'account'],
      args: '[$lpTokenId, "$address"]',
      sendNullAsArg: false,
    );
    if (res == null) {
      return null;
    }

    final lpb = LPBalance.fromJson(res as Map<String, dynamic>);
    return lpb.balanceBigInt;
  }

  @override
  Future<BigInt> totalLPTokensSupply({
    required final int lpTokenId,
  }) async {
    final dynamic res = await polkawalletSdk.api.universal.callNoSign(
      calls: ['query', 'poscanPoolAssets', 'asset'],
      args: '[$lpTokenId]',
      sendNullAsArg: false,
    );

    return BigInt.parse(
      ((res as Map<String, dynamic>)['supply'] as String).replaceAll(',', ''),
    );
  }

  @override
  Future<RawPoolReserve?> poolReserve(final BasicPoolEntity basicPool) async {
    final String getPoolReserversFunc = """
let m1 = ${assetFieldToJS(basicPool.firstAsset)}
let m2 = ${assetFieldToJS(basicPool.secondAsset)}

let res = await pools.getPoolReserves(api, m1, m2);

return res;
""";

    // logger.t('CODE ' + getPoolReserversFunc);

    final dynamic res = await basicJSCall(
      getPoolReserversFunc,
      polkawalletSdk.webView!.webInstance!.webViewController,
    );

    logger.t('poolReserve res: $res');
    // [10,530,015,434, 9,509,085,784]

    if (res == null) {
      return null;
    }

    final resT = RawPoolReserve.fromJson(res as List<dynamic>);
    return resT;
  }

  @override
  Future<List<BasicPoolEntity>> poolsBasic() async {
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
    logger.t('PoolsBasic res: $res');

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
    return resT.toList();
  }

  @override
  Future<void> createPool({
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
  Future<void> addLiquidity({
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
  Future<void> removeLiquidity({
    required final RemoveLiquidityParams params,
    required final void Function(String p1) msgIdCallback,
  }) async {
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

    logger.t(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'assetConversion', 'removeLiquidity'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<int> existentialDeposit() async {
    const String getPoolsFunc = """
var p = () => {
 return api.consts.balances.existentialDeposit.toHuman();
};
var res = await p();
return res;
""";

    final dynamic res = await basicJSCall(
      getPoolsFunc,
      polkawalletSdk.webView!.webInstance!.webViewController,
    );
    return int.parse(res.toString().replaceAll(',', ''));
  }

  @override
  Future<void> swapAssets({
    required final SwapAssetsParams params,
    required final void Function(String p1) msgIdCallback,
  }) async {
    final args = [
      [
        params.asset1.toJSArg(),
        params.asset2.toJSArg(),
      ],
      BigIntJsonHelper.encode(params.amount1),
      BigIntJsonHelper.encode(params.amount2),
      params.account.pubKey,
      params.keepAlive,
    ];

    String argsEncoded = '';
    argsEncoded = const JsonEncoder().convert(args);
    argsEncoded = BigIntJsonHelper.replace(argsEncoded);

    logger.t(argsEncoded);
    logger.t('Calling tx.assetConversion.${params.swapMethod.name}');
    // params.updateStatus();
    // return Either.right(null);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'assetConversion', params.swapMethod.name],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: params.updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  Future<String> callTokenServiceRoutine(
    final String tokenServiceCall,
  ) async {
    final String code = """
var p = async () => {
  return tokenServices.$tokenServiceCall;
};
var res = await p();
return res;
""";

    final dynamic res = await basicJSCall(
      code,
      polkawalletSdk.webView!.webInstance!.webViewController,
    );
    // [[[Native, {Asset: 4}], {lpToken: 0}]]
    logger.t(
      'callTokenServiceRoutine. tokenServiceCall: $tokenServiceCall res: $res',
    );
    if (res is String) {
      return res;
    } else {
      // logger.e('res should be String');
      throw WrongTypeFailure(
        'res',
        'String',
        res.runtimeType.toString(),
      );
    }
  }

  @override
  Future<String> getAssetTokenFromNativeToken({
    required final int assetTokenId,
    required final BigInt nativeTokenValue,
  }) =>
      callTokenServiceRoutine(
        'getAssetTokenFromNativeToken(api, "$assetTokenId", "$nativeTokenValue")',
      );

  @override
  Future<String> getAssetTokenAFromAssetTokenB({
    required final int assetToken1Id,
    required final int assetToken2Id,
    required final BigInt assetToken2Value,
  }) =>
      callTokenServiceRoutine(
        'getAssetTokenAFromAssetTokenB(api, "$assetToken2Value", "$assetToken1Id", "$assetToken2Id")',
      );

  @override
  Future<String> getAssetTokenBFromAssetTokenA({
    required final int assetToken1Id,
    required final int assetToken2Id,
    required final BigInt assetToken1Value,
  }) =>
      callTokenServiceRoutine(
        'getAssetTokenBFromAssetTokenA(api, "$assetToken1Value", "$assetToken1Id", "$assetToken2Id")',
      );

  @override
  Future<String> getNativeTokenFromAssetToken({
    required final int assetTokenId,
    required final BigInt assetTokenValue,
  }) =>
      callTokenServiceRoutine(
        'getNativeTokenFromAssetToken(api, "$assetTokenId", "$assetTokenValue")',
      );
}
