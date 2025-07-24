import 'package:flutter/foundation.dart';

abstract class InMemoryCache<T> {
  final Map<String, (T, DateTime)> _cache = {};

  T? get(final String key) {
    final value = _cache[key];
    if (value == null) return null;
    if (isExpired(value.$2)) {
      remove(key);
      return null;
    }
    return value.$1;
  }

  void set(final String key, final T value, [final DateTime? expiresAt]) =>
      _cache[key] = (
        value,
        expiresAt ?? DateTime.now(),
      );

  void remove(final String key) => _cache.remove(key);

  void clear() => _cache.clear();

  Duration get expirationDuration;

  bool isExpired(final DateTime date) =>
      DateTime.now().difference(date) > expirationDuration;
}

abstract class InMemoryCacheSingleton<T> extends InMemoryCache<T> {
  @override
  @protected
  T? get(String key) => super.get(key);

  @override
  @protected
  void set(final String key, final T value, [final DateTime? expiresAt]) =>
      super.set(key, value, expiresAt);

  T? value() => get('value');
  void store(final T value) => set('value', value);
}
