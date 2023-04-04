import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.data.gql.dart';
import 'package:threedp_graphql/features/tokens_events_history/data/query/__generated__/get_tokens_events.req.gql.dart';
import 'package:threedp_graphql/features/tokens_events_history/domain/events_request_params.dart';

class EventsDatasourceGQL {
  final Client client;

  const EventsDatasourceGQL({
    required this.client,
  });

  Future<Either<Failure, GGetEventsData>> fetchTransfers(
    final GetEventsParams requestParams,
  ) async {
    final request = GGetEventsReq((final b) {
      b
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber = requestParams.blockNumber.toString()
        ..vars.filters.extrinsicIdx = requestParams.extrinsicIdx
        ..vars.filters.eventModule = requestParams.eventModule
        ..vars.filters.eventName = requestParams.eventName;
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
