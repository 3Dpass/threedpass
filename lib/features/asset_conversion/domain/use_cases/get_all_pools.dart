import 'package:super_core/super_core.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
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

      PoscanAssetMetadata? asset1Meta;
      PoscanAssetMetadata? asset2Meta;

      if (pool.firstAsset.assetId != null) {
        final metadataReq =
            await poscanAssetsRepo.metadata(pool.firstAsset.assetId!);
        metadataReq.when(
          left: (e) => logE(e.toString()),
          right: (final data) => asset1Meta = data,
        );
      }

      if (pool.secondAsset.assetId != null) {
        final metadataReq =
            await poscanAssetsRepo.metadata(pool.secondAsset.assetId!);
        metadataReq.when(
          left: (e) => logE(e.toString()),
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
          // asset1Meta: !pool.firstAsset.isNative
          //     ? poscanAssetsCubit.state.metadata[pool.firstAsset.assetId]
          //     : null,
          // asset2Meta: !pool.secondAsset.isNative
          //     ? poscanAssetsCubit.state.metadata[pool.secondAsset.assetId]
          //     : null,
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
