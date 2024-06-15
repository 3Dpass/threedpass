import 'package:super_core/super_core.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';

class GetAllPools extends UseCase<List<PoolFullInfo>, GetAllPoolsParams> {
  final AssetConversionRepository assetConversionRepository;
  final PoscanAssetsCubit
      poscanAssetsCubit; // TODO Refactor this to save metadata in the repository. Make local and remote repo

  const GetAllPools({
    required this.assetConversionRepository,
    required this.poscanAssetsCubit,
  });

  @override
  Future<Either<Failure, List<PoolFullInfo>>> call(
    final GetAllPoolsParams params,
  ) async {
    final res = <PoolFullInfo>[];

    final basicPools = await assetConversionRepository.poolsBasic();
    for (final pool in basicPools) {
      final reserve = await assetConversionRepository.poolReserve(pool);
      final lpBalanceResponse = await assetConversionRepository.lpTokens(
        lpTokenId: pool.lpTokenId,
        address: params.address,
      );

      final lpBalance = lpBalanceResponse.when(
        left: (final e) {
          return null;
        },
        right: (final data) {
          return data;
        },
      );

      if (reserve != null) {
        res.add(
          PoolFullInfo(
            basicInfo: pool,
            rawPoolReserve: reserve,
            lpBalance: lpBalance,
            asset1Meta: !pool.firstAsset.isNative
                ? poscanAssetsCubit.state.metadata[pool.firstAsset.assetId]
                : null,
            asset2Meta: !pool.secondAsset.isNative
                ? poscanAssetsCubit.state.metadata[pool.secondAsset.assetId]
                : null,
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
