import 'package:super_core/super_core.dart';
import 'package:threedp_graphql/features/events/domain/events_request_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/events_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/success_event_type.dart';

class GetEventsUseCase extends UseCase<SuccessEvenType, GetEventsParams> {
  final EventsRepository repository;

  const GetEventsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, SuccessEvenType>> call(
    final GetEventsParams params,
  ) async {
    return repository.fetchEvent(params);
  }
}
