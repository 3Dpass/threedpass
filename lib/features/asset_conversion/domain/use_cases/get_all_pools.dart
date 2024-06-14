import 'package:super_core/super_core.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';

class GetAllPools extends UseCase<List<PoolFullInfo>, GetAllPoolsParams> {
  final AssetConversionRepository assetConversionRepository;

  const GetAllPools({
    required this.assetConversionRepository,
  });

  @override
  Future<Either<Failure, List<PoolFullInfo>>> call(
    final GetAllPoolsParams params,
  ) async {
    final res = <PoolFullInfo>[];

    final basicPools = await assetConversionRepository.poolsBasic();
    for (final pool in basicPools) {
      final reserve = await assetConversionRepository.poolReserve(pool);
      final lpBalance = await assetConversionRepository.lpTokens(
        lpTokenId: pool.lpTokenId,
        address: params.address,
      );

      if (reserve != null && lpBalance != null) {
        res.add(
          PoolFullInfo(
            basicInfo: pool,
            rawPoolReserve: reserve,
            lpBalance: lpBalance,
          ),
        );
      } else {
        return const Either.left(
          NoDataFailure(
            'Something went wrong',
          ),
        );
      }
    }

    return Either.right(res);
  }
}

class GetAllPoolsParams {
  const GetAllPoolsParams({
    required this.address,
  });
  final String address;
}
