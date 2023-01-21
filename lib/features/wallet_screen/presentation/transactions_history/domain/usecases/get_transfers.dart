import 'package:logger/logger.dart';
import 'package:threedpass/core/utils/failure.dart';
import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/core/utils/usecase.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/data/repositories/transfers_repository.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_request_params.dart';

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
