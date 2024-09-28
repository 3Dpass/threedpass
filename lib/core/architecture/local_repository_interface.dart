import 'dart:async';

abstract class LocalRepoI<TData, Params> {
  FutureOr<TData?> get(final Params params);

  Future<void> set(final TData data);
}
