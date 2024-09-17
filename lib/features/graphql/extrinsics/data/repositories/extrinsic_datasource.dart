import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils%20copy/int_to_nullable_string.dart';
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart';
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.req.gql.dart';
import 'package:threedpass/features/graphql/extrinsics/domain/extrisincs_request_params.dart';

class ExtrinsicDatasourceGQL {
  final Client client;

  const ExtrinsicDatasourceGQL({
    required this.client,
  });

  Future<Either<Failure, GGetExtrinsicsData>> fetchExtrinsincs(
    final GetExtrisincsParams requestParams,
  ) async {
    final request = GGetExtrinsicsReq((final b) {
      b
        ..fetchPolicy = FetchPolicy.NoCache
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber =
            requestParams.blockNumber.toNullableString()
        ..vars.filters.extrinsicIdx =
            requestParams.extrinsicIdx.toNullableString()
        ..vars.filters.callModule = requestParams.callModule
        ..vars.filters.callName = requestParams.callName
        ..vars.filters.multiAddressAccountId =
            requestParams.multiAddressAccountId;
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
