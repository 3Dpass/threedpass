import 'package:super_core/super_core.dart';
import 'package:threedpass/features/graphql/extrinsics/domain/extrisincs_request_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/assets_extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/get_extrinsics_usecase_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/transfer_non_native_tokens_dto.dart';

class AssetsGetExtrinsics
    extends UseCase<TransfersNonNativeTokenDTO, GetExtrisincsParams> {
  final AssetsExtrinsicsRepository repository;
  final GetExtrinsicsUseCaseParams paramsUseCase;

  const AssetsGetExtrinsics({
    required this.repository,
    required this.paramsUseCase,
  });

  @override
  Future<Either<Failure, TransfersNonNativeTokenDTO>> call(
    final GetExtrisincsParams params,
  ) async {
    return repository.fetchExtrinsincs(
      params,
      paramsUseCase.poscanAssetCombined.poscanAssetData.id,
    );
  }
}
