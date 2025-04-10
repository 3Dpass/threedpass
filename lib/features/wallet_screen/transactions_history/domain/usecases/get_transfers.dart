import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/rest/models/transfers_response.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/get_transfers_params.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/data/repositories/transfers_repository.dart';

class GetTransfers extends UseCase<TransfersResponse, GetTransfersParams> {
  final TransfersRepository repository;

  const GetTransfers({required this.repository});

  @override
  Future<TransfersResponse> call(
    final GetTransfersParams params,
  ) async {
    return repository.fetchTransfers(params);
  }
}
