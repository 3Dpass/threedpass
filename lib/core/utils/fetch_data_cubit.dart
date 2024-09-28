import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/usecase.dart';
import 'package:threedpass/core/utils/async_value.dart';

class FetchDataCubit<T, P> extends Cubit<AsyncValue<T>> {
  FetchDataCubit({
    required this.useCase,
    required this.params,
  }) : super(const AsyncValue.loading());

  final UseCase<T, P> useCase;
  final P params;

  Future<void> fetchData() async {
    emit(const AsyncValue.loading());

    await useCase.safeCall(
      params: params,
      onSuccess: (final T value) {
        emit(AsyncValue.data(value));
      },
      onError: (final Object error, final StackTrace stackTrace) {
        emit(
          AsyncValue.error(
            error,
            stackTrace,
          ),
        );
      },
    );
  }
}
