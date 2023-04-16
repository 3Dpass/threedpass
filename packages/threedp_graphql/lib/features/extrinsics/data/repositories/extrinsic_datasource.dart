import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/core/utils/int_to_nullable_string.dart';
import 'package:threedp_graphql/features/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart';
import 'package:threedp_graphql/features/extrinsics/data/query/__generated__/get_extrnsics.req.gql.dart';
import 'package:threedp_graphql/features/extrinsics/domain/extrisincs_request_params.dart';

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
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber =
            requestParams.blockNumber?.toNullableString()
        ..vars.filters.extrinsicIdx =
            requestParams.extrinsicIdx?.toNullableString()
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
