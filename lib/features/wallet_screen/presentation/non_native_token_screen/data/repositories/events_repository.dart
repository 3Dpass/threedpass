import 'package:ferry/ferry.dart';
import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/events/data/repositories/events_datasource_local.dart';
import 'package:threedp_graphql/features/events/data/repositories/events_datasource_remote.dart';
import 'package:threedp_graphql/features/events/domain/events_request_params.dart';
import 'package:threedpass/core/polkawallet/bloc/app_service_cubit.dart';
import 'package:threedpass/features/wallet_screen/presentation/non_native_token_screen/domain/entities/success_event_type.dart';

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
  ) async {}
}
