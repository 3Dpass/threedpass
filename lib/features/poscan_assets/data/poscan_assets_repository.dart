import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/encode_args.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_balance.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/create_asset.dart';
import 'package:threedpass/setup.dart';

abstract class PoscanAssetsRepository {
  const PoscanAssetsRepository({
    required this.appServiceLoaderCubit,
  });

  final AppServiceLoaderCubit appServiceLoaderCubit;

  Future<Either<Failure, void>> create({
    required final CreateAssetParams params,
    required final void Function() updateStatus,
    required final void Function(String) msgIdCallback,
  });
  Future<Either<Failure, void>> setMetadata();
  Future<Either<Failure, void>> mint();
  Future<Either<Failure, void>> transfer();
  Future<Either<Failure, List<PoscanAssetData>>> allTokens();
  Future<Either<Failure, List<PoscanAssetBalance>>>
      tokensBalancesForCurrentAccount(List<PoscanAssetData> tokens);
}

class PoscanAssetsRepositoryImpl implements PoscanAssetsRepository {
  const PoscanAssetsRepositoryImpl({required this.appServiceLoaderCubit});

  @override
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

    try {
      // final file = File(params.pathToFile);
      // final bytes = file.readAsStringSync();
      // final jbytes = jsonEncode(bytes);
      bool flag = true;

      final dynamic res =
          await appServiceLoaderCubit.state.plugin.sdk.api.universal.callSign(
        pubKey: params.admin.pubKey!,
        password: params.password,
        calls: ['tx', 'poscanAssets', 'create'],
        args: argsEncoded,
        onStatusChange: (final p0) {
          // print('$p0');
          if (flag) {
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

  @override
  Future<Either<Failure, void>> setMetadata() async {
    return const Either.right(null);
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
    const String getTokensFunc = """
var p = async () => {
  const call = await api.query.poscanAssets.asset.entries();
  const res = call.map(([{ args: [assetId] }, data]) => ({id: assetId.toNumber(), ...data.toHuman(),})).sort((a, b) => a.id - b.id);
  return res;
};
var res = await p();
return res;
""";

    // TODO Typecast to CallAsyncJavaScriptResult from inappwebview
    final dynamic res = await appServiceLoaderCubit.state.plugin.sdk.api
        .universal.service.serviceRoot.webView!.webInstance!.webViewController
        .callAsyncJavaScript(
      functionBody: getTokensFunc,
    );

    final dynamic json = jsonEncode(res);
    print(json);

    try {
      final List<dynamic> tokensRaw = res.value as List<dynamic>;
      final List<PoscanAssetData> tokens = tokensRaw
          .map((final dynamic e) =>
              PoscanAssetData.fromJson(e as Map<String, dynamic>))
          .toList();
      return Either.right(tokens);
    } on Object catch (e) {
      getIt<Logger>().e(e);
      return Either.left(NoDataFailure('allTokens() error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<PoscanAssetBalance>>>
      tokensBalancesForCurrentAccount(List<PoscanAssetData> tokens) {
    // api.query.assets.account()
    //  appServiceLoaderCubit.state.plugin.sdk.api.assets.queryAssetsBalances(ids, address)
    // TODO: implement tokensBalancesForCurrentAccount
    throw UnimplementedError();
  }
}
