import 'package:threedpass/features/rest/models/transfers_response.dart';
import 'package:threedpass/features/wallet_screen/transactions_history/domain/entities/get_transfers_params.dart';
import 'package:threedpass/features/rest/rest_client.dart';

class TransfersRepository {
  final RestClient rest;

  const TransfersRepository({
    required this.rest,
  });

  Future<TransfersResponse> fetchTransfers(
    final GetTransfersParams requestParams,
  ) {
    return rest.getTransfers(
      requestParams.address,
      requestParams.page,
      requestParams.pageSize,
    );
  }
}
