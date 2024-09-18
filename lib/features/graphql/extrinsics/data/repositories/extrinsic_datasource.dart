import 'package:ferry/ferry.dart';
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.data.gql.dart';
import 'package:threedpass/features/graphql/extrinsics/data/query/__generated__/get_extrnsics.req.gql.dart';
import 'package:threedpass/features/graphql/extrinsics/domain/extrisincs_request_params.dart';

class ExtrinsicDatasourceGQL {
  final Client client;

  const ExtrinsicDatasourceGQL({
    required this.client,
  });

  Future<GGetExtrinsicsData> fetchExtrinsincs(
    final GetExtrisincsParams requestParams,
  ) async {
    final request = GGetExtrinsicsReq((final b) {
      b
        ..fetchPolicy = FetchPolicy.NoCache
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber = requestParams.blockNumber?.toString()
        ..vars.filters.extrinsicIdx = requestParams.extrinsicIdx?.toString()
        ..vars.filters.callModule = requestParams.callModule
        ..vars.filters.callName = requestParams.callName
        ..vars.filters.multiAddressAccountId =
            requestParams.multiAddressAccountId;
    });
    final response = await client.request(request).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(response.linkException.toString());
    } else {
      return response.data!;
    }
  }
}
