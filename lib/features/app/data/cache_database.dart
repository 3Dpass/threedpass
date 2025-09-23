import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:threedpass/features/chains/domain/entities/chain_type.dart';
import 'package:threedpass/features/chains/data/block_time_caches.dart';
import 'package:threedpass/features/poscan_objects_query/data/uploaded_object_caches.dart';

part 'cache_database.g.dart';

@DriftDatabase(tables: [
  BlockTimeCaches,
  UploadedObjectCaches,
  UploadedObjectContents,
])
class CacheDatabase extends _$CacheDatabase {
  CacheDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'cache_db',
      native: const DriftNativeOptions(),
    );
  }
}
