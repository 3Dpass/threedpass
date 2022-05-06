import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';

class HiveHashStore extends HiveUniversalStore<HashObject> {
  HiveHashStore() : super(boxName: 'hashes');
}
