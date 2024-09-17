import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
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

  Future<Either<Failure, SuccessEvenType>> fetchEvent(
    final GetEventsParams requestParams,
  ) async {
    // Get local data
    final localRes = eventsDatasourceLocal.fetchTransfers(requestParams);

    return localRes.when(
      right: (final data) {
        // if has local data, use it
        return Either.right(
          SuccessEvenType(data),
        );
      },
      left: (final error) async {
        // if no local data, ask for remote
        final remoteRes =
            await eventsDatasourceGQL.fetchTransfers(requestParams);

        return remoteRes.when(
          right: (final bloatedResp) {
            // is no local data, but has remote
            // save it and use.
            eventsDatasourceLocal.writeCache(
              bloatedResp.request,
              bloatedResp.data,
            );
            return Either.right(
              SuccessEvenType(bloatedResp.data),
            );
          },
          left: (final err) {
            // if neither local not remote data, return error
            return Either.left(err);
          },
        );
      },
    );
  }
}
