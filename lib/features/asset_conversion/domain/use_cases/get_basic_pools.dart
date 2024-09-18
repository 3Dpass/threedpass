import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/get_all_tokens_data.dart';

class GetBasicPools extends UseCase<List<PoolFullInfo>, GetAllPoolsParams> {
  final AssetConversionRepository assetConversionRepository;
  final PoscanAssetsRepository poscanAssetsRepo;

  final GetAllTokensData getAllTokensData;

  const GetBasicPools({
    required this.assetConversionRepository,
    required this.poscanAssetsRepo,
    required this.getAllTokensData,
  });

  @override
  Future<List<PoolFullInfo>> call(
    final GetAllPoolsParams params,
  ) async {
    final res = <PoolFullInfo>[];

    final tokensData = await poscanAssetsRepo.allTokens();

    final basicPools = await assetConversionRepository.poolsBasic();
    for (final pool in basicPools) {
      final reserve = await assetConversionRepository.poolReserve(pool);
      final lpBalance = await assetConversionRepository.lpTokens(
        lpTokenId: pool.lpTokenId,
        address: params.address,
      );

      final totalLPSupply = await assetConversionRepository.totalLPTokensSupply(
        lpTokenId: pool.lpTokenId,
      );

      PoscanAssetMetadata? asset1Meta;
      PoscanAssetMetadata? asset2Meta;

      if (pool.firstAsset.assetId != null) {
        asset1Meta = await poscanAssetsRepo.metadata(pool.firstAsset.assetId!);
      }

      if (pool.secondAsset.assetId != null) {
        asset2Meta = await poscanAssetsRepo.metadata(pool.secondAsset.assetId!);
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

    return res;
  }
}

class GetAllPoolsParams {
  const GetAllPoolsParams({
    required this.address,
  });
  final String address;
}
