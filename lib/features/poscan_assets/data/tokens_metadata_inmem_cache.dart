import 'package:threedpass/core/persistence/in_memory_cache.dart';
import 'package:threedpass/features/poscan_assets/domain/entities/poscan_asset_metadata.dart';

class TokensMetadataInMemCache
    extends InMemoryCacheSingleton<PoscanAssetMetadataMap> {
  @override
  Duration get expirationDuration => const Duration(minutes: 2);
}
