import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/encode_args.dart';
import 'package:threedpass/features/poscan_assets/data/get_tokens_info_utility.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/set_metadata.dart';
import 'package:threedpass/setup.dart';

abstract class PoscanAssetsRepository {
  const PoscanAssetsRepository();

  Future<Either<Failure, void>> create({
    required final CreateAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
  Future<Either<Failure, void>> setMetadata({
    required final SetMetadataParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
  Future<Either<Failure, void>> mint();
  Future<Either<Failure, void>> transfer();
  Future<Either<Failure, List<PoscanAssetData>>> allTokens();
  Future<Either<Failure, Map<int, PoscanAssetMetadata>>> tokensMetadata();
  Future<Map<int, PoscanAssetBalance>> tokensBalancesForCurrentAccount(
    final Iterable<int> tokenIds,
    final String address,
  );
}

class PoscanAssetsRepositoryImpl implements PoscanAssetsRepository {
  const PoscanAssetsRepositoryImpl({required this.appServiceLoaderCubit});

  // TODO Move to another deeper repo layer
  Future<Either<Failure, void>> abstractExtrinsicCall({
    required final String argsEncoded,
    required final String pubKey,
    required final String password,
    required final List<String> calls,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    try {
      bool flag = true;

      final dynamic res =
          await appServiceLoaderCubit.state.plugin.sdk.api.universal.callSign(
        pubKey: pubKey,
        password: password,
        calls: calls,
        args: argsEncoded,
        onStatusChange: (final p0) {
          if (flag) {
            // Update status once to detec if extrinsic is accepted
            updateStatus();
            flag = false;
          }
        },
        msgIdCallback: msgIdCallback,
      );

      getIt<Logger>().d(res);
      if (res is Map) {
        final String key = res.keys.first as String;
        if (key == 'error') {
          return Either.left(NoDataFailure(res[key].toString()));
        } else {
          return const Either.right(null);
        }
      } else {
        return const Either.left(NoDataFailure('res is not a Map'));
      }
    } on Object catch (e) {
      getIt<Logger>().e(e);
      return Either.left(NoDataFailure(e.toString()));
    }
  }

  final AppServiceLoaderCubit appServiceLoaderCubit;

  @override
  Future<Either<Failure, void>> create({
    required final CreateAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  }) async {
    final args = [
      params.assetId,
      params.admin.pubKey!,
      params.minBalance,
      // keys https://github.com/3Dpass/3DP/blob/3134dad0ed1502462620ba84a4dee4e1b109996b/pallets/poscan-assets/src/types.rs#L41
      {
        'obj_idx': params.objIdx,
        'prop_idx': params.propIdx,
        'max_supply': params.maxSupply,
      },
    ];
    final argsEncoded = encodeArgs(args);
    print(argsEncoded);

    return abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAssets', 'create'],
      pubKey: params.admin.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<Either<Failure, void>> setMetadata({
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
    final argsEncoded = encodeArgs(args);
    print(argsEncoded);

    return abstractExtrinsicCall(
      argsEncoded: argsEncoded,
      calls: ['tx', 'poscanAssets', 'setMetadata'],
      pubKey: params.admin.pubKey!,
      password: params.password,
      updateStatus: updateStatus,
      msgIdCallback: msgIdCallback,
    );
  }

  @override
  Future<Either<Failure, void>> mint() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, void>> transfer() async {
    return const Either.right(null);
  }

  @override
  Future<Either<Failure, List<PoscanAssetData>>> allTokens() async {
    final utility = GetTokensInfoUtility<PoscanAssetData>(
      call: 'asset',
      appService: appServiceLoaderCubit.state,
      toElement: (final dynamic e) =>
          PoscanAssetData.fromJson(e as Map<String, dynamic>),
    );
    return utility.getTokensInfo();
  }

  @override
  Future<Either<Failure, Map<int, PoscanAssetMetadata>>>
      tokensMetadata() async {
    final utility = GetTokensInfoUtility<PoscanAssetMetadata>(
      call: 'metadata',
      appService: appServiceLoaderCubit.state,
      toElement: (final dynamic e) =>
          PoscanAssetMetadata.fromJson(e as Map<String, dynamic>),
    );
    final metadataResult = await utility.getTokensInfo();
    return metadataResult.when(
      left: (final e) {
        return Either.left(e);
      },
      right: (final data) {
        final res = <int, PoscanAssetMetadata>{};
        for (final e in data) {
          res[e.id] = e;
        }
        return Either.right(res);
      },
    );
  }

  @override
  Future<Map<int, PoscanAssetBalance>> tokensBalancesForCurrentAccount(
    final Iterable<int> tokensIds,
    final String address,
  ) async {
    getIt<Logger>().d('tokensBalancesForCurrentAccount $tokensIds $address');
    final res = <int, PoscanAssetBalance>{};

    for (final id in tokensIds) {
      final String getBalanceFunc = """
var p = (await api.query.poscanAssets.account($id, "$address")).toHuman();
return p;
""";

      // TODO Typecast to CallAsyncJavaScriptResult from inappwebview
      final dynamic response = await appServiceLoaderCubit.state.plugin.sdk.api
          .universal.service.serviceRoot.webView!.webInstance!.webViewController
          .callAsyncJavaScript(
        functionBody: getBalanceFunc,
      );

      try {
        final dataRaw = response.value as Map<String, dynamic>;
        final balance = PoscanAssetBalance.fromJson(dataRaw);
        res[id] = balance;
      } on Object {
        // getIt<Logger>().w(e);
      }
    }

    return res;
  }
}
