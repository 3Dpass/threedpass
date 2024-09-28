import 'dart:convert';

import 'package:polkawallet_sdk/polkawallet_sdk.dart';
import 'package:threedpass/core/polkawallet/utils/call_signed_extrinsic.dart';
import 'package:threedpass/core/polkawallet/utils/none_mock.dart';
import 'package:threedpass/core/utils/big_int_json_helper.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_assets/data/get_tokens_info_utility.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/mint_asset.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/set_metadata.dart';

abstract class PoscanAssetsRepository {
  const PoscanAssetsRepository();

  Future<void> create({
    required final CreateAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
  Future<void> setMetadata({
    required final SetMetadataParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
  Future<void> mint({
    required final MintAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });

  // Future<void> transfer();
  Future<List<PoscanAssetData>> allTokens();
  Future<Map<int, PoscanAssetMetadata>> tokensMetadata();
  Future<Map<int, PoscanAssetBalance>> tokensBalancesForCurrentAccount(
    final Iterable<int> tokenIds,
    final String address,
  );

  Future<PoscanAssetMetadata?> metadata(final int _);
}

class PoscanAssetsRepositoryImpl implements PoscanAssetsRepository {
  const PoscanAssetsRepositoryImpl({
    required this.polkawalletSDK,
    required this.callSignExtrinsicUtil,
  });

  // final AppServiceLoaderCubit appServiceLoaderCubit;
  final CallSignExtrinsicUtil callSignExtrinsicUtil;
  final WalletSDK polkawalletSDK;

  @override
  Future<void> create({
    required final CreateAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final args = [
      params.assetId,
      params.admin.pubKey!,
      params.minBalance,
      // keys https://github.com/3Dpass/3DP/blob/3134dad0ed1502462620ba84a4dee4e1b109996b/pallets/poscan-assets/src/types.rs#L41
    ];

    if (params.objDetails != null) {
      final maxSupply = BigInt.parse(params.objDetails!.maxSupply);
      final objDataRaw = {
        'obj_idx': int.parse(params.objDetails!.objIdx),
        'prop_idx': int.parse(params.objDetails!.propIdx),
        'max_supply': BigIntJsonHelper.encode(maxSupply),
      };
      args.add(objDataRaw);
    } else {
      args.add(NoneMock());
    }

    String argsEncoded = '';
    argsEncoded = const JsonEncoder().convert(args);
    argsEncoded = BigIntJsonHelper.replace(argsEncoded);

    logger.t(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAssets', 'create'],
      pubKey: params.admin.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<void> setMetadata({
    required final SetMetadataParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final args = [
      params.assetId,
      params.name,
      params.symbol,
      params.decimals,
    ];
    final argsEncoded = const JsonEncoder().convert(args);
    logger.t(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAssets', 'setMetadata'],
      pubKey: params.admin.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<void> mint({
    required final MintAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final args = [
      params.assetId,
      BigIntJsonHelper.encode(params.amount),
    ];
    final argsPreEncoded = const JsonEncoder().convert(args);
    final argsEncoded = BigIntJsonHelper.replace(argsPreEncoded);
    logger.t(argsEncoded);

    return callSignExtrinsicUtil.abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAssets', 'mint'],
      pubKey: params.account.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  // @override
  // Future<void> transfer() async {
  //   return const Either.right(null);
  // }

  @override
  Future<List<PoscanAssetData>> allTokens() async {
    final utility = GetTokensInfoUtility<PoscanAssetData>(
      call: 'asset',
      webviewController: polkawalletSDK.webView!.webInstance!.webViewController,
      toElement: (final dynamic e) =>
          PoscanAssetData.fromJson(e as Map<String, dynamic>),
    );
    return utility.getTokensInfo();
  }

  @override
  Future<Map<int, PoscanAssetMetadata>> tokensMetadata() async {
    final utility = GetTokensInfoUtility<PoscanAssetMetadata>(
      call: 'metadata',
      webviewController: polkawalletSDK.webView!.webInstance!.webViewController,
      toElement: (final dynamic e) =>
          PoscanAssetMetadata.fromJson(e as Map<String, dynamic>),
    );
    final metadataResult = await utility.getTokensInfo();
    final res = <int, PoscanAssetMetadata>{};
    for (final e in metadataResult) {
      res[e.id] = e;
    }
    return res;
  }

  @override
  Future<Map<int, PoscanAssetBalance>> tokensBalancesForCurrentAccount(
    final Iterable<int> tokensIds,
    final String address,
  ) async {
    logger.d('tokensBalancesForCurrentAccount $tokensIds $address');
    final res = <int, PoscanAssetBalance>{};

    for (final id in tokensIds) {
      final String getBalanceFunc = """
var p = (await api.query.poscanAssets.account($id, "$address")).toHuman();
return p;
""";
      final dynamic response = await polkawalletSDK
          .webView!.webInstance!.webViewController
          .callAsyncJavaScript(
        functionBody: getBalanceFunc,
      );

      try {
        final dataRaw = response.value as Map<String, dynamic>;
        final balance = PoscanAssetBalance.fromJson(dataRaw);
        res[id] = balance;
      } on Object {
        // logger.w(e);
      }
    }

    return res;
  }

  @override
  Future<PoscanAssetMetadata?> metadata(
    final int assetId,
  ) async {
    final dynamic res = await polkawalletSDK.api.universal.callNoSign(
      calls: ['query', 'poscanAssets', 'metadata'],
      args: '[$assetId]',
      sendNullAsArg: false,
    );

    if (res is Map<String, dynamic>) {
      res['id'] = assetId;
      final metadata = PoscanAssetMetadata.fromJson(res);
      if (metadata.isNull) {
        return null;
      } else {
        return metadata;
      }
    } else {
      return null;
    }
  }
}
