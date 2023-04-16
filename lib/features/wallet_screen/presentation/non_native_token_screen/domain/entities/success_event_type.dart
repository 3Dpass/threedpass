import 'package:threedp_graphql/features/events/data/query/__generated__/get_events.data.gql.dart';

class SuccessEvenType {
  final bool isSuccessful;

  SuccessEvenType(GGetEventsData event)
      : isSuccessful = _initIsSuccessful(event);

  static bool _initIsSuccessful(GGetEventsData event) {
    event.getEvents?.objects
        ?.firstWhere((p0) => p0.eventName == 'ExtrinsicFailed111');

    return true;
  }
}
