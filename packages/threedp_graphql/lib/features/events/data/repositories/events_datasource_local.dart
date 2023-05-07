import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/events/data/query/__generated__/get_events.data.gql.dart';
import 'package:threedp_graphql/features/events/data/query/__generated__/get_events.req.gql.dart';
import 'package:threedp_graphql/features/events/domain/events_request_params.dart';

class EventsDatasourceLocal {
  final Cache cache;

  const EventsDatasourceLocal({
    required this.cache,
  });

  void writeCache(GGetEventsReq request, GGetEventsData data) {
    cache.writeQuery(request, data);
  }

  Either<Failure, GGetEventsData> fetchTransfers(
    final GetEventsParams requestParams,
  ) {
    final request = GGetEventsReq((final b) {
      b
        ..vars.pageKey = requestParams.pageKey
        ..vars.pageSize = requestParams.pageSize
        ..vars.filters.blockNumber = requestParams.blockNumber.toString()
        ..vars.filters.extrinsicIdx = requestParams.extrinsicIdx
        ..vars.filters.eventModule = requestParams.eventModule
        ..vars.filters.eventName = requestParams.eventName;
    });
    final response = cache.readQuery(request);

    if (response == null) {
      return const Either.left(
        NoDataFailure('No data stored'),
      );
    } else {
      return Either.right(response);
    }
  }
}
