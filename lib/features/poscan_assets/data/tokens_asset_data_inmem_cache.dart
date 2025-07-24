import 'package:threedpass/core/persistence/in_memory_cache.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_token_data.dart';

class TokensAssetDataInMemCache
    extends InMemoryCacheSingleton<List<PoscanAssetData>> {
  @override
  Duration get expirationDuration => const Duration(minutes: 2);
}
