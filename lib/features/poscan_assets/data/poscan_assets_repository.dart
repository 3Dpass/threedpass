import 'package:json_bigint/json_bigint.dart';
import 'package:logger/logger.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/core/utils/encode_args.dart';
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

    try {
      // final file = File(params.pathToFile);
      // final bytes = file.readAsStringSync();
      // final jbytes = jsonEncode(bytes);
      print('pubKey ${params.admin.pubKey!}');

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
