import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/features/graphql/events/domain/events_request_params.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/data/repositories/events_repository.dart';
import 'package:threedpass/features/wallet_screen/non_native_token_screen/domain/entities/success_event_type.dart';

class GetEventsUseCase extends UseCase<SuccessEvenType, GetEventsParams> {
  final EventsRepository repository;

  const GetEventsUseCase({
    required this.repository,
  });

  @override
  Future<SuccessEvenType> call(
    final GetEventsParams params,
  ) async {
    return repository.fetchEvent(params);
  }
}
