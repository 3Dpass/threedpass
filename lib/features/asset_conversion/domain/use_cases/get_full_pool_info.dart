import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/get_all_tokens_data.dart';
import 'package:threedpass/features/poscan_assets/domain/use_cases/get_all_tokens_metadata.dart';

class GetFullPoolInfo extends UseCase<PoolFullInfo, GetFullPoolInfoParams> {
  final AssetConversionRepository assetConversionRepository;
  final GetAllTokensData getAllTokensData;
  final GetAllTokensMetadata getAllTokensMetadata;

  const GetFullPoolInfo({
    required this.assetConversionRepository,
    required this.getAllTokensMetadata,
    required this.getAllTokensData,
  });

  @override
  Future<PoolFullInfo> call(
    final GetFullPoolInfoParams params,
  ) async {
    final pool = params.basicPool;
    final metadatas = await getAllTokensMetadata.call(null);

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
      asset1Meta = metadatas[pool.firstAsset.assetId!];
    }

    if (pool.secondAsset.assetId != null) {
      asset2Meta = metadatas[pool.secondAsset.assetId!];
    }

    final tokensData = await getAllTokensData.call(null);

    return PoolFullInfo(
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
      totalLpTokenSupply: totalLPSupply,
    );
  }
}

class GetFullPoolInfoParams {
  const GetFullPoolInfoParams({
    required this.basicPool,
    required this.address,
  });

  final BasicPoolEntity basicPool;
  final String address;
}
