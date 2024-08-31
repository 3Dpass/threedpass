import 'package:stack_trace/stack_trace.dart';
// THIS IS INSPIRED BY RIVERPOD
// https://github.com/rrousselGit/riverpod/blob/4814c2ec8453a780212727ae59dd7b520c1ada26/packages/riverpod/lib/src/common.dart

abstract class AsyncValue<T> {
  const AsyncValue._();

  const factory AsyncValue.data(final T value) = AsyncData<T>;
  const factory AsyncValue.loading([final T? value]) = AsyncLoading<T>;
  const factory AsyncValue.error(
    final Object error,
    final StackTrace stackTrace,
  ) = AsyncError<T>;

  bool get isLoading;
  bool get hasValue;
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
  });

  /// Clone an [AsyncValue], merging it with [previous].
  ///
  /// When doing so, the resulting [AsyncValue] can contain the information
  /// about multiple state at once.
  /// For example, this allows an [AsyncError] to contain a [value], or even
  /// [AsyncLoading] to contain both a [value] and an [error].
  ///
  /// The optional [isRefresh] flag (true by default) represents whether the
  /// provider rebuilt by [Ref.refresh]/[Ref.invalidate] (if true)
  /// or instead by [Ref.watch] (if false).
  /// This changes the default behavior of [when] and sets the [isReloading]/
  /// [isRefreshing] flags accordingly.
  AsyncValue<T> copyWithPrevious(
    final AsyncValue<T> previous, {
    final bool isRefresh = true,
  });

  // /// The opposite of [copyWithPrevious], reverting to the raw [AsyncValue]
  // /// with no information on the previous state.
  // AsyncValue<T> unwrapPrevious() {
  //   return map(
  //     data: (final d) {
  //       if (d.isLoading) return AsyncLoading<T>();
  //       return AsyncData(d.value);
  //     },
  //     error: (final e) {
  //       if (e.isLoading) return AsyncLoading<T>();
  //       return AsyncError(e.error, e.stackTrace);
  //     },
  //     loading: (final l) => AsyncLoading<T>(),
  //   );
  // }

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

/// {@macro asyncvalue.data}
class AsyncData<T> extends AsyncValue<T> {
  /// {@macro asyncvalue.data}
  const AsyncData(final T value)
      : this._(
          value,
          isLoading: false,
          error: null,
          stackTrace: null,
        );

  const AsyncData._(
    this.value, {
    required this.isLoading,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  final T value;

  @override
  bool get hasValue => true;

  @override
  final bool isLoading;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
  }) {
    return data(this);
  }

  @override
  AsyncData<T> copyWithPrevious(
    final AsyncValue<T> previous, {
    final bool isRefresh = true,
  }) {
    return this;
  }

  // @override
  // AsyncValue<R> _cast<R>() {
  //   if (T == R) return this as AsyncValue<R>;
  //   return AsyncData<R>._(
  //     value as R,
  //     isLoading: isLoading,
  //     error: error,
  //     stackTrace: stackTrace,
  //   );
  // }
}

/// {@macro asyncvalue.loading}
class AsyncLoading<T> extends AsyncValue<T> {
  /// {@macro asyncvalue.loading}
  const AsyncLoading([final T? maybeValue])
      : hasValue = false,
        value = maybeValue,
        error = null,
        stackTrace = null,
        super._();

  const AsyncLoading._({
    required this.hasValue,
    required this.value,
    required this.error,
    required this.stackTrace,
  }) : super._();

  @override
  bool get isLoading => true;

  @override
  final bool hasValue;

  @override
  final T? value;

  @override
  final Object? error;

  @override
  final StackTrace? stackTrace;

  // @override
  // AsyncValue<R> _cast<R>() {
  //   if (T == R) return this as AsyncValue<R>;
  //   return AsyncLoading<R>._(
  //     hasValue: hasValue,
  //     value: value as R?,
  //     error: error,
  //     stackTrace: stackTrace,
  //   );
  // }

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
  }) {
    return loading(this);
  }

  @override
  AsyncValue<T> copyWithPrevious(
    final AsyncValue<T> previous, {
    final bool isRefresh = true,
  }) {
    if (isRefresh) {
      return previous.map(
        data: (final d) => AsyncData._(
          d.value,
          isLoading: true,
          error: d.error,
          stackTrace: d.stackTrace,
        ),
        error: (final e) => AsyncError._(
          e.error,
          isLoading: true,
          value: e.valueOrNull,
          stackTrace: e.stackTrace,
          hasValue: e.hasValue,
        ),
        loading: (final _) => this,
      );
    } else {
      return previous.map(
        data: (final d) => AsyncLoading._(
          hasValue: true,
          value: d.valueOrNull,
          error: d.error,
          stackTrace: d.stackTrace,
        ),
        error: (final e) => AsyncLoading._(
          hasValue: e.hasValue,
          value: e.valueOrNull,
          error: e.error,
          stackTrace: e.stackTrace,
        ),
        loading: (final e) => e,
      );
    }
  }
}

/// {@macro asyncvalue.error_ctor}
class AsyncError<T> extends AsyncValue<T> {
  /// {@macro asyncvalue.error_ctor}
  const AsyncError(final Object error, final StackTrace stackTrace)
      : this._(
          error,
          stackTrace: stackTrace,
          isLoading: false,
          hasValue: false,
          value: null,
        );

  const AsyncError._(
    this.error, {
    required this.stackTrace,
    required final T? value,
    required this.hasValue,
    required this.isLoading,
  })  : _value = value,
        super._();

  @override
  final bool isLoading;

  @override
  final bool hasValue;

  final T? _value;

  @override
  T? get value {
    if (!hasValue) {
      throwErrorWithCombinedStackTrace(error, stackTrace);
    }
    return _value;
  }

  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  // @override
  // AsyncValue<R> _cast<R>() {
  //   if (T == R) return this as AsyncValue<R>;
  //   return AsyncError<R>._(
  //     error,
  //     stackTrace: stackTrace,
  //     isLoading: isLoading,
  //     value: _value as R?,
  //     hasValue: hasValue,
  //   );
  // }

  @override
  R map<R>({
    required final R Function(AsyncData<T> data) data,
    required final R Function(AsyncError<T> error) error,
    required final R Function(AsyncLoading<T> loading) loading,
  }) {
    return error(this);
  }

  @override
  AsyncError<T> copyWithPrevious(
    final AsyncValue<T> previous, {
    final bool isRefresh = true,
  }) {
    return AsyncError._(
      error,
      stackTrace: stackTrace,
      isLoading: isLoading,
      value: previous.valueOrNull,
      hasValue: previous.hasValue,
    );
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
      throwErrorWithCombinedStackTrace(error!, stackTrace!);
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

/// Rethrows [error] with a stacktrace that is the combination of [stackTrace]
/// and [StackTrace.current].
Never throwErrorWithCombinedStackTrace(
  final Object error,
  final StackTrace stackTrace,
) {
  final chain = Chain([
    Trace.current(),
    ...Chain.forTrace(stackTrace).traces,
  ]).foldFrames((final frame) => frame.package == 'riverpod');

  Error.throwWithStackTrace(error, chain.toTrace().vmTrace);
}
