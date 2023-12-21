import 'package:threedp_graphql/features/events/data/query/__generated__/get_events.data.gql.dart';
import 'package:threedpass/core/polkawallet/utils/extrinsic_status.dart';

class SuccessEvenType {
  final ExtrinsicStatus isSuccessful;

  SuccessEvenType(final GGetEventsData event)
      : isSuccessful = _initIsSuccessful(event);

  static ExtrinsicStatus _initIsSuccessful(final GGetEventsData event) {
    try {
      final ex = event.getEvents?.objects
          ?.firstWhere((final p0) => p0.eventModule == 'System');
      switch (ex?.eventName ?? '') {
        case 'ExtrinsicFailed':
          return ExtrinsicStatus.failed;
        case 'ExtrinsicSuccess':
          return ExtrinsicStatus.success;
        default:
          return ExtrinsicStatus.error;
      }
    } on Object catch (_) {
      return ExtrinsicStatus.error;
    }
  }
}
