import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/tokens_events_history/domain/extrisincs_request_params.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/data/repositories/extrinsics_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/transfer_non_native_tokens_dto.dart';

class GetExtrinsics
    extends UseCase<TransfersNonNativeTokenDTO, GetExtrisincsParams> {
  final ExtrinsicsRepository repository;
  final String address;
  final int assetID;

  const GetExtrinsics({required this.repository});

  @override
  Future<Either<Failure, TransfersNonNativeTokenDTO>> call(
    final GetExtrisincsParams params,
  ) async {
    return repository.fetchExtrinsincs(params);
  }
}
