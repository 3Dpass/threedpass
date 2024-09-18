import 'package:ferry/ferry.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/graphql/events/data/repositories/events_datasource_local.dart';
import 'package:threedpass/features/graphql/events/data/repositories/events_datasource_remote.dart';
import 'package:threedpass/features/graphql/events/domain/events_request_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/success_event_type.dart';

class EventsRepository {
  final Client client;
  final AppServiceLoaderCubit appServiceLoaderCubit;
  final EventsDatasourceGQL eventsDatasourceGQL;
  final EventsDatasourceLocal eventsDatasourceLocal;

  const EventsRepository({
    required this.client,
    required this.appServiceLoaderCubit,
    required this.eventsDatasourceGQL,
    required this.eventsDatasourceLocal,
  });

  Future<SuccessEvenType> fetchEvent(
    final GetEventsParams requestParams,
  ) async {
    // Get local data
    final localRes = eventsDatasourceLocal.fetchTransfers(requestParams);

    if (localRes != null) {
      return SuccessEvenType(localRes);
    } else {
      final bloatedResp =
          await eventsDatasourceGQL.fetchTransfers(requestParams);

      eventsDatasourceLocal.writeCache(
        bloatedResp.request,
        bloatedResp.data,
      );
      return SuccessEvenType(bloatedResp.data);
    }
  }
}
