import 'package:logger/logger.dart';
import 'package:threedpass/core/utils/logger.dart';

typedef SafeUseCaseCall<TResult, Params> = Future<void> Function({
  required Params params,
  required void Function(Object, StackTrace) onError,
  required void Function(TResult) onSuccess,
});

abstract class UseCase<TResult, Params> {
  const UseCase();

  Future<TResult> call(final Params params);

  Future<void> safeCall({
    required final Params params,
    required final void Function(Object, StackTrace) onError,
    required final void Function(TResult) onSuccess,
  }) async {
    try {
      onSuccess(await call(params));
    } on Object catch (e, stackTrace) {
      logger.log(
        Level.error,
        'Error in usecase',
        error: e,
        stackTrace: stackTrace,
      );
      onError(e, stackTrace);
    }
  }
}
