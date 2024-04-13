import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
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
  Future<Either<Failure, List<PoscanTokenData>>> allTokens();
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
      params.assetId.toString(),
      params.admin.pubKey!,
      params.password,
      params.minBalance.toString(),
      {
        'objIdx': params.objIdx,
        'propIdx': params.propIdx,
        'maxSupply': params.maxSupply,
      }.toString(),
    ];
    final argsEncoded = jsonEncode(args);
    print(argsEncoded);

    return Either.right(null);

    try {
      // final file = File(params.pathToFile);
      // final bytes = file.readAsStringSync();
      // final jbytes = jsonEncode(bytes);

      bool flag = true;

      // final dynamic res = await poscanApi.putObject(
      //   pubKey: params.account.pubKey!,
      //   password: params.password,
      //   category: params.categoryFabric.build(),
      //   file: jbytes,
      //   nApprovals: params.nApprovals,
      //   hashes: params.hashes,
      //   propValue: params.propValues,
      //   onStatusChange: (final p0) {
      //     // print('$p0');
      //     if (flag) {
      //       updateStatus();
      //       flag = false;
      //     }
      //   },
      //   msgIdCallback: msgIdCallback,
      // );

      final dynamic res =
          await appServiceLoaderCubit.state.plugin.sdk.api.universal.callSign(
        pubKey: params.admin.pubKey!,
        password: params.password,
        calls: ['tx', 'poscanAssets', 'create'],
        args: args,
      );
      getIt<Logger>().d(res);
      if (res is Map) {
        final String key = res.keys.first as String;
        if (key == 'error') {
          return Either.left(NoDataFailure(res[key].toString()));
        } else {
          return Either.right(res.values.join(''));
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
  Future<Either<Failure, List<PoscanTokenData>>> allTokens() async {
    //   final dynamic lol = await service.plugin.sdk.api.universal.callNoSign(
    //   calls: ['query', 'poscanAssets', 'metadata', 'entries'],
    //   args: null,
    // );
    return const Either.right(
      [
        PoscanTokenData(
          assetId: 1,
          fullName: 'Some long long long long long long long long long name',
          symbols: 'SML',
        ),
        PoscanTokenData(
          assetId: 42,
          fullName: 'Some',
          symbols: 'SM',
        ),
        PoscanTokenData(
          assetId: 228,
          fullName: 'Yeah boy',
          symbols: 'LOL',
        ),
      ],
    );
  }
}
