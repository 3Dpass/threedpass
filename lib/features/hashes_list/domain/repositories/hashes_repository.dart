import 'package:threedpass/features/hashes_list/data/repositories/store.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hashes_model.dart';
import 'package:threedpass/features/hashes_list/presentation/bloc/hashes_list_bloc.dart';

abstract class HashesRepository {
  List<HashesModel> getAll();
  Future<void> saveHash(HashesModel hash);
  Future<void> deleteHash(HashesModel hash);
}

class HashesRepositoryImpl implements HashesRepository {
  const HashesRepositoryImpl({
    required this.hiveHashStore,
  });

  final HiveHashStore hiveHashStore;

  @override
  Future<void> deleteHash(HashesModel hash) async {
    await hiveHashStore.removeObject(hash);
  }

  @override
  List<HashesModel> getAll() {
    return hiveHashStore.getAll().toList();
  }

  @override
  Future<void> saveHash(HashesModel hash) async {
    await hiveHashStore.addObject(hash);
  }
}
