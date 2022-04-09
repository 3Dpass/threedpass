import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';

class HiveHashStore extends HiveUniversalStore<HashesModel> {
  HiveHashStore() : super(boxName: 'hashes');
}
