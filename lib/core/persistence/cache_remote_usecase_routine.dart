import 'package:threedpass/core/persistence/in_memory_cache.dart';
import 'package:threedpass/core/utils/logger.dart';

Future<T> cacheSingletonRemoteUsecaseRoutine<T>({
  required final Future<T> Function() getRemote,
  required final InMemoryCacheSingleton<T> cache,
}) async {
  final cached = cache.value();
  logger.t('$T cached in mem: ${cached != null}');
  if (cached != null) return cached;
  final data = await getRemote();
  cache.store(data);
  return data;
}
