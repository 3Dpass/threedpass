import 'package:stack_trace/stack_trace.dart';
// THIS IS INSPIRED BY RIVERPOD
// https://github.com/rrousselGit/riverpod/blob/4814c2ec8453a780212727ae59dd7b520c1ada26/packages/riverpod/lib/src/common.dart

sealed class AsyncValue<T> {
  const AsyncValue._();

  const factory AsyncValue.data(final T value) = AsyncData<T>;
  const factory AsyncValue.loading([final T? value]) = AsyncLoading<T>;
  // const factory AsyncValue.initial() = AsyncInitial<T>;
  const factory AsyncValue.error(
    final Object error,
    final StackTrace stackTrace,
  ) = AsyncError<T>;

  bool get hasValue => value != null;
  bool get hasError => error != null;

  bool get isLoading;
  bool get isInitial;
  T? get value;
  Object? get error;
  StackTrace? get stackTrace;
  // AsyncValue<R> _cast<R>();

  /// Perform some action based on the current state of the [AsyncValue].
  ///
  /// This allows reading the content of an [AsyncValue] in a type-safe way,
  /// without potentially ignoring to handle a case.
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
    required final R Function(AsyncInitial<T> initial) initial,
  });

  @override
  String toString() {
    final content = [
      if (isLoading && this is! AsyncLoading) 'isLoading: $isLoading',
      if (hasValue) 'value: $value',
      if (hasError) ...[
        'error: $error',
        'stackTrace: $stackTrace',
      ],
    ].join(', ');

    return '$runtimeType($content)';
  }

  @override
  bool operator ==(final Object other) {
    return runtimeType == other.runtimeType &&
        other is AsyncValue<T> &&
        other.isLoading == isLoading &&
        other.hasValue == hasValue &&
        other.error == error &&
        other.stackTrace == stackTrace &&
        other.valueOrNull == valueOrNull;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        isLoading,
        hasValue,
        valueOrNull,
        error,
        stackTrace,
      );
}

class AsyncInitial<T> extends AsyncValue<T> {
  const AsyncInitial([final T? maybeValue])
      : value = maybeValue,
        error = null,
        stackTrace = null,
        super._();

  @override
  bool get isLoading => false;

  @override
  final bool isInitial = true;

  @override
  final T? value;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
    required final R Function(AsyncInitial<T> initial) initial,
  }) =>
      initial(this);
}

class AsyncData<T> extends AsyncValue<T> {
  const AsyncData(final T value)
      : this._(
          value,
          error: null,
          stackTrace: null,
        );

  const AsyncData._(
    this.value, {
    required this.error,
    required this.stackTrace,
    this.isLoading = false,
  }) : super._();

  @override
  final T value;

  @override
  final bool isLoading;

  @override
  final bool isInitial = false;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
    required final R Function(AsyncInitial<T> initial) initial,
  }) {
    return data(this);
  }
}

class AsyncLoading<T> extends AsyncValue<T> {
  const AsyncLoading([final T? maybeValue])
      : value = maybeValue,
        error = null,
        stackTrace = null,
        super._();

  @override
  bool get isLoading => true;

  @override
  final bool isInitial = false;

  @override
  final T? value;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
    required final R Function(AsyncInitial<T> initial) initial,
  }) {
    return loading(this);
  }
}

class AsyncError<T> extends AsyncValue<T> {
  const AsyncError(final Object error, final StackTrace stackTrace)
      : this._(
          error,
          stackTrace: stackTrace,
          isLoading: false,
          value: null,
        );

  const AsyncError._(
    this.error, {
    required this.stackTrace,
    required final T? value,
    required this.isLoading,
  })  : _value = value,
        super._();

  @override
  final bool isLoading;

  @override
  final bool isInitial = false;

  final T? _value;

  @override
  T? get value => _value;

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
    required final R Function(AsyncInitial<T> initial) initial,
  }) {
    return error(this);
  }
}

/// An extension that adds methods like [when] to an [AsyncValue].
extension AsyncValueX<T> on AsyncValue<T> {
  /// If [hasValue] is true, returns the value.
  /// Otherwise if [hasError], rethrows the error.
  /// Finally if in loading state, throws a [StateError].
  ///
  /// This is typically used for when the UI assumes that [value] is always present.
  T get requireValue {
    if (hasValue) return value as T;
    if (hasError) {
      Error.throwWithStackTrace(
          error ?? Exception('No value'), Trace.current().vmTrace);
    }

    throw StateError(
      'Tried to call `requireValue` on an `AsyncValue` that has no value: $this',
    );
  }

  /// Return the value or previous value if in loading/error state.
  ///
  /// If there is no previous value, null will be returned during loading/error state.
  ///
  /// This is different from [value], which will rethrow the error instead of returning null.
  ///
  /// If you do not want to return previous value during loading/error states,
  /// consider using [unwrapPrevious] :
  ///
  /// ```dart
  /// ref.watch(provider).unwrapPrevious()?.valueOrNull;
  /// ```
  T? get valueOrNull {
    if (hasValue) return value;
    return null;
  }

  /// Whether the associated provider was forced to recompute even though
  /// none of its dependencies has changed, after at least one [value]/[error] was emitted.
  ///
  /// This is usually the case when rebuilding a provider with either
  /// [Ref.invalidate]/[Ref.refresh].
  ///
  /// If a provider rebuilds because one of its dependencies changes (using [Ref.watch]),
  /// then [isRefreshing] will be false, and instead [isReloading] will be true.
  bool get isRefreshing =>
      isLoading && (hasValue || hasError) && this is! AsyncLoading;

  /// Whether the associated provider was recomputed because of a dependency change
  /// (using [Ref.watch]), after at least one [value]/[error] was emitted.
  ///
  /// If a provider rebuilds because one of its dependencies changed (using [Ref.watch]),
  /// then [isReloading] will be true.
  /// If a provider rebuilds only due to [Ref.invalidate]/[Ref.refresh], then
  /// [isReloading] will be false (and [isRefreshing] will be true).
  ///
  /// See also [isRefreshing] for manual provider rebuild.
  bool get isReloading => (hasValue || hasError) && this is AsyncLoading;

  /// Whether [error] is not null.
  ///
  /// Even if [hasError] is true, it is still possible for [hasValue]/[isLoading]
  /// to also be true.
  // It is safe to check it through `error != null` because `error` is non-nullable
  // on the AsyncError constructor.
  bool get hasError => error != null;

  /// Performs an action based on the state of the [AsyncValue].
  ///
  /// All cases are required, which allows returning a non-nullable value.
  ///
  /// {@template asyncvalue.skip_flags}
  /// By default, [when] skips "loading" states if triggered by a [Ref.refresh]
  /// or [Ref.invalidate] (but does not skip loading states if triggered by [Ref.watch]).
  ///
  /// In the event that an [AsyncValue] is in multiple states at once (such as
  /// when reloading a provider or emitting an error after a valid data),
  /// [when] offers various flags to customize whether it should call
  /// [loading]/[error]/[data] :
  ///
  /// - [skipLoadingOnReload] (false by default) customizes whether [loading]
  ///   should be invoked if a provider rebuilds because of [Ref.watch].
  ///   In that situation, [when] will try to invoke either [error]/[data]
  ///   with the previous state.
  ///
  /// - [skipLoadingOnRefresh] (true by default) controls whether [loading]
  ///   should be invoked if a provider rebuilds because of [Ref.refresh]
  ///   or [Ref.invalidate].
  ///   In that situation, [when] will try to invoke either [error]/[data]
  ///   with the previous state.
  ///
  /// - [skipError] (false by default) decides whether to invoke [data] instead
  ///   of [error] if a previous [value] is available.
  /// {@endtemplate}
  R when<R>({
    required final R Function(T data) data,
    required final R Function(Object error, StackTrace stackTrace) error,
    required final R Function() loading,
    final bool skipLoadingOnReload = false,
    final bool skipLoadingOnRefresh = true,
    final bool skipError = false,
  }) {
    if (isLoading) {
      bool skip;
      if (isRefreshing) {
        skip = skipLoadingOnRefresh;
      } else if (isReloading) {
        skip = skipLoadingOnReload;
      } else {
        skip = false;
      }
      if (!skip) return loading();
    }

    if (hasError && (!hasValue || !skipError)) {
      return error(this.error!, stackTrace!);
    }

    return data(requireValue);
  }
}
