import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/transfers_history/domain/entities/transfers_request_params.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/data/repositories/transfers_repository.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/transfers_dto.dart';

class GetTransfers extends UseCase<TransfersDTO, GetTransfersParams> {
  final TransfersRepository repository;

  const GetTransfers({required this.repository});

  @override
  Future<Either<Failure, TransfersDTO>> call(
    final GetTransfersParams params,
  ) async {
    return repository.fetchTransfers(params);
  }
}
