import 'package:ferry/ferry.dart';
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.data.gql.dart';
import 'package:threedpass/features/graphql/events/data/query/__generated__/get_events.req.gql.dart';
import 'package:threedpass/features/graphql/events/domain/events_request_params.dart';
import 'package:threedpass/features/graphql/utils/bloated_response.dart';

class EventsDatasourceGQL {
  final Client client;

  const EventsDatasourceGQL({
    required this.client,
  });

  Future<BloatedResponse<GGetEventsReq, GGetEventsData>> fetchTransfers(
    final GetEventsParams requestParams,
  ) async {
    final request = GGetEventsReq((final b) {
      b
        ..fetchPolicy = FetchPolicy.CacheFirst
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber = requestParams.blockNumber.toString()
        ..vars.filters.extrinsicIdx = requestParams.extrinsicIdx
        ..vars.filters.eventModule = requestParams.eventModule
        ..vars.filters.eventName = requestParams.eventName;
    });
    final response = await client.request(request).first;

    if (response.hasErrors || response.data == null) {
      throw Exception(response.linkException.toString());
    } else {
      return BloatedResponse(
        request: request,
        data: response.data!,
      );
    }
  }
}
