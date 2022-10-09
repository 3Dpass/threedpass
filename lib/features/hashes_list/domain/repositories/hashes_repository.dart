import 'package:threedpass/features/hashes_list/data/repositories/hash_list_store.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';

abstract class HashesRepository {
  List<HashObject> getAll();

  Future<void> addObject(final HashObject hash);
  Future<void> deleteObject(final HashObject hash);
  Future<void> replaceObject(final HashObject hash);
}

class HashesRepositoryImpl implements HashesRepository {
  const HashesRepositoryImpl({
    required this.hiveHashStore,
  });

  final HiveHashStore hiveHashStore;

  @override
  Future<void> deleteObject(final HashObject hash) async {
    await hiveHashStore.removeObject(hash);
  }

  @override
  List<HashObject> getAll() {
    return hiveHashStore.getAll().toList();
  }

  @override
  Future<void> addObject(final HashObject hash) async {
    await hiveHashStore.addObject(hash);
  }

  @override
  Future<void> replaceObject(final HashObject hash) async {
    await hiveHashStore.replace(hash);
  }
}
