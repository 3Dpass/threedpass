import 'package:threedp_graphql/features/events/data/query/__generated__/get_events.data.gql.dart';
import 'package:threedpass/features/wallet_screen/domain/entities/transfer_history_ui.dart';

class SuccessEvenType {
  final ExtrisincStatus isSuccessful;

  SuccessEvenType(final GGetEventsData event)
      : isSuccessful = _initIsSuccessful(event);

  static ExtrisincStatus _initIsSuccessful(final GGetEventsData event) {
    try {
      final ex = event.getEvents?.objects
          ?.firstWhere((final p0) => p0.eventModule == 'System');
      switch (ex?.eventName ?? '') {
        case 'ExtrinsicFailed':
          return ExtrisincStatus.failed;
        case 'ExtrinsicSuccess':
          return ExtrisincStatus.success;
        default:
          return ExtrisincStatus.error;
      }
    } on Object catch (_) {
      return ExtrisincStatus.error;
    }
  }
}
