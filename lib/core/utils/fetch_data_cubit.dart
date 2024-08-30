import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_core/super_core.dart';
import 'package:threedpass/core/utils/async_value.dart';

class FetchDataCubit<T, P> extends Cubit<AsyncValue<T>> {
  FetchDataCubit({
    required this.useCase,
    required this.params,
  }) : super(const AsyncValue.loading());

  final UseCase<T, P> useCase;
  final P params;

  Future<void> fetchData() async {
    try {
      emit(const AsyncValue.loading());

      final response = await useCase.call(params);

      response.when(
        left: (final Failure value) {
          emit(AsyncValue.error(value, StackTrace.current));
        },
        right: (final T value) {
          emit(AsyncValue.data(value));
        },
      );
    } on Object catch (e) {
      emit(
        AsyncValue.error('Error while fetching data. $e', StackTrace.current),
      );
    }
  }
}
