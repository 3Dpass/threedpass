import 'package:polkawallet_sdk/storage/types/keyPairData.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/asset_conversion/data/asset_conversion_repository.dart';
import 'package:threedpass/features/asset_conversion/domain/entities/basic_pool_entity.dart';

class CreatePool extends UseCase<void, CreatePoolParams> {
  final AssetConversionRepository assetConversionRepository;
  // final PoscanAssetsRepository poscanAssetsRepo;

  const CreatePool({
    required this.assetConversionRepository,
    // required this.poscanAssetsRepo,
  });

  @override
  Future<Either<Failure, void>> call(
    final CreatePoolParams params,
  ) async {
    if (params.asset1.isNative && params.asset2.isNative) {
      return Either.left(
        BadDataFailure('Impossible to create pool of two native assets'),
      );
    }
    return Either.right(null);
  }
}

class CreatePoolParams {
  final PoolAssetField asset1;
  final PoolAssetField asset2;
  final KeyPairData account;
  final String password;
  final void Function() updateStatus;

  const CreatePoolParams({
    required this.asset1,
    required this.asset2,
    required this.updateStatus,
    required this.account,
    required this.password,
  });
}
