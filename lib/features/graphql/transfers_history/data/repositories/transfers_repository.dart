import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/features/graphql/transfers_history/data/query/__generated__/get_transfers.data.gql.dart';
import 'package:threedpass/features/graphql/transfers_history/data/query/__generated__/get_transfers.req.gql.dart';
import 'package:threedpass/features/graphql/transfers_history/domain/entities/transfers_request_params.dart';

class TransfersDatasourceGQL {
  final Client client;

  const TransfersDatasourceGQL({
    required this.client,
  });

  Future<Either<Failure, GGetTransfersData>> fetchTransfers(
    final GetTransfersParams requestParams,
  ) async {
    final request = GGetTransfersReq((final b) {
      b
        ..fetchPolicy = FetchPolicy.NoCache
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.toMultiAddressAccountId =
            requestParams.toMultiAddressAccountId
        ..vars.filters.fromMultiAddressAccountId =
            requestParams.fromMultiAddressAccountId;
    });
    final response = await client.request(request).first;

    if (response.hasErrors || response.data == null) {
      return Either.left(
        NetworkFailure(response.linkException.toString()),
      );
    } else {
      return Either.right(response.data!);
    }
  }
}
