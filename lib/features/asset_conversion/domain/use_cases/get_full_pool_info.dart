// import 'package:super_core/super_core.dart';
// import 'package:threedpass/core/utils/logger.dart';
// import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
// import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';
// import 'package:threedpass/features/asset_conversion/domain/entities/pool_full_info.dart';
// import 'package:threedpass/features/poscan_assets/data/poscan_assets_repository.dart';
// import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

// class GetFullPoolInfo extends UseCase<PoolFullInfo, GetFullPoolInfoParams> {
//   final AssetConversionRepository assetConversionRepository;
//   final PoscanAssetsRepository poscanAssetsRepo;

//   const GetFullPoolInfo({
//     required this.assetConversionRepository,
//     required this.poscanAssetsRepo,
//   });

//   @override
//   Future<Either<Failure, PoolFullInfo>> call(
//     final GetFullPoolInfoParams params,
//   ) async {
//     final pool = params.basicPool;

//     final reserve = await assetConversionRepository.poolReserve(pool);
//     final lpBalanceResponse = await assetConversionRepository.lpTokens(
//       lpTokenId: pool.lpTokenId,
//       address: params.address,
//     );

//     final lpBalance = lpBalanceResponse.when(
//       left: (final e) {
//         return null;
//       },
//       right: (final data) {
//         return data;
//       },
//     );

//     final totalLPSupplyResponse =
//         await assetConversionRepository.totalLPTokensSupply(
//       lpTokenId: pool.lpTokenId,
//     );

//     final totalLPSupply = totalLPSupplyResponse.when(
//       left: (final e) {
//         return null;
//       },
//       right: (final data) {
//         return data;
//       },
//     );

//     PoscanAssetMetadata? asset1Meta;
//     PoscanAssetMetadata? asset2Meta;

//     if (pool.firstAsset.assetId != null) {
//       final metadataReq =
//           await poscanAssetsRepo.metadata(pool.firstAsset.assetId!);
//       metadataReq.when(
//         left: (final e) => logger.e(e),
//         right: (final data) => asset1Meta = data,
//       );
//     }

//     if (pool.secondAsset.assetId != null) {
//       final metadataReq =
//           await poscanAssetsRepo.metadata(pool.secondAsset.assetId!);
//       metadataReq.when(
//         left: (final e) => logger.e(e),
//         right: (final data) => asset2Meta = data,
//       );
//     }

//     // print('first asset id ${pool.firstAsset.assetId}');
//     // print('second asset id ${pool.secondAsset.assetId}');
//     // poscanAssetsCubit.state.metadata.keys.forEach((element) {
//     //   print(element);
//     // });

//     return Either.right(
//       PoolFullInfo(
//         basicInfo: pool,
//         rawPoolReserve: reserve,
//         lpBalance: lpBalance,
//         asset1Meta: asset1Meta,
//         asset2Meta: asset2Meta,
//         asset1Data: pool.firstAsset.isNative
//             ? null
//             : tokensData.firstWhere(
//                 (final token) => token.id == pool.firstAsset.assetId!,
//               ),
//         asset2Data: pool.secondAsset.isNative
//             ? null
//             : tokensData.firstWhere(
//                 (final token) => token.id == pool.secondAsset.assetId!,
//               ),
//         totalLpTokenSupply: totalLPSupply!,
//       ),
//     );

//     // return Either.right(res);
//   }
// }

// class GetFullPoolInfoParams {
//   const GetFullPoolInfoParams({
//     required this.basicPool,
//     required this.address,
//   });

//   final BasicPoolEntity basicPool;
//   final String address;
// }
