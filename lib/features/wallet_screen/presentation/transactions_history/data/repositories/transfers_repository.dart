import 'package:ferry/ferry.dart';
import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/core/utils/failure.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/data/query/__generated__/get_transfers.req.gql.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_dto.dart';
import 'package:threedpass/features/wallet_screen/presentation/transactions_history/domain/entities/transfers_request_params.dart';

class TransfersRepository {
  final Client client;

  const TransfersRepository({
    required this.client,
  });

  Future<Either<Failure, TransfersDTO>> fetchTransfers(
    final GetTransfersParams requestParams,
  ) async {
    final request = GGetTransfersReq((final b) {
      b
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.toMultiAddressAccountId =
            requestParams.toMultiAddressAccountId
        ..vars.filters.fromMultiAddressAccountId =
            requestParams.fromMultiAddressAccountId;
    });
    final response = await client.request(request).first;

    if (response.hasErrors) {
      return Either.left(
        NetworkFailure(response.linkException.toString()),
      );
    }

    final newTransfers = response.data!.getTransfers;
    final newObjects = newTransfers!.objects!.toList();
    final nextPageKey = newTransfers.pageInfo!.pageNext!;

    return Either.right(
      TransfersDTO(
        objects: newObjects,
        nextPageKey: nextPageKey,
      ),
    );
  }
}
