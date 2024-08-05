import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class GetAllPools extends UseCase<List<PoolFullInfo>, GetAllPoolsParams> {
  final AssetConversionRepository assetConversionRepository;
  final PoscanAssetsRepository poscanAssetsRepo;

  const GetAllPools({
    required this.assetConversionRepository,
    required this.poscanAssetsRepo,
  });

  @override
  Future<Either<Failure, List<PoolFullInfo>>> call(
    final GetAllPoolsParams params,
  ) async {
    final res = <PoolFullInfo>[];

    final tokensData = (await poscanAssetsRepo.allTokens())
        .when(left: (final _) => null, right: (final data) => data);

    if (tokensData == null) {
      return const Either.left(NetworkFailure('Failed to get tokens data'));
    }

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

      final totalLPSupplyResponse =
          await assetConversionRepository.totalLPTokensSupply(
        lpTokenId: pool.lpTokenId,
      );

      final totalLPSupply = totalLPSupplyResponse.when(
        left: (final e) {
          return null;
        },
        right: (final data) {
          return data;
        },
      );

      PoscanAssetMetadata? asset1Meta;
      PoscanAssetMetadata? asset2Meta;

      if (pool.firstAsset.assetId != null) {
        final metadataReq =
            await poscanAssetsRepo.metadata(pool.firstAsset.assetId!);
        metadataReq.when(
          left: (final e) => logger.e(e),
          right: (final data) => asset1Meta = data,
        );
      }

      if (pool.secondAsset.assetId != null) {
        final metadataReq =
            await poscanAssetsRepo.metadata(pool.secondAsset.assetId!);
        metadataReq.when(
          left: (final e) => logger.e(e),
          right: (final data) => asset2Meta = data,
        );
      }

      // print('first asset id ${pool.firstAsset.assetId}');
      // print('second asset id ${pool.secondAsset.assetId}');
      // poscanAssetsCubit.state.metadata.keys.forEach((element) {
      //   print(element);
      // });

      res.add(
        PoolFullInfo(
          basicInfo: pool,
          rawPoolReserve: reserve,
          lpBalance: lpBalance,
          asset1Meta: asset1Meta,
          asset2Meta: asset2Meta,
          asset1Data: pool.firstAsset.isNative
              ? null
              : tokensData.firstWhere(
                  (final token) => token.id == pool.firstAsset.assetId!,
                ),
          asset2Data: pool.secondAsset.isNative
              ? null
              : tokensData.firstWhere(
                  (final token) => token.id == pool.secondAsset.assetId!,
                ),
          totalLpTokenSupply: totalLPSupply!,
        ),
      );
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
