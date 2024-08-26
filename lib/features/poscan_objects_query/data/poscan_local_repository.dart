import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

// TODO Refactor. Make use cases insted of calling this from cubit
class PoScanLocalRepository {
  PoScanLocalRepository();

  final Completer<void> initialized = Completer<void>();
  bool _isInitialized = false;
  late Isar isar;

  Future<Stream<void>> get objectsChanged async {
    await initialized.future;
    return isar.uploadedObjects.watchLazy();
  }

  Future<void> open(final int ss58) async {
    _isInitialized = false;

    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UploadedObjectSchema],
      directory: dir.path,
      name: 'isar_objects_cache_$ss58',
    );

    _isInitialized = true;
    initialized.complete();
  }

  Future<void> clear() async {
    return afterInit(
      () async => isar.writeTxn(
        () async {
          return isar.clear();
        },
      ),
    );
  }

  Future<int> countEntries() async {
    return afterInit(
      () async => isar.uploadedObjects.where().count(),
    );
  }

  Future<int> put(final UploadedObject object) async {
    return afterInit(
      () async => isar.writeTxn(() async {
        return isar.uploadedObjects.put(object);
      }),
    );
  }

  Future<UploadedObject?> get(final int id) async {
    return afterInit(() async => isar.uploadedObjects.get(id));
  }

  Future<T> afterInit<T>(final Future<T> Function() func) async {
    if (_isInitialized) {
      return func();
    } else {
      logger.e('ObjectsStore is not initialized');

      throw Exception('ObjectsStore is not initialized');
    }
  }

  Future<List<UploadedObject>> filterByOwner(final String address) async {
    return afterInit(() async {
      return isar.uploadedObjects.filter().ownerEqualTo(address).findAll();
    });
  }

  Future<UploadedObject?> firstIfContainsAnyHash(
      final List<String> hashes) async {
    return afterInit(() async {
      final filters = hashes
          .map<FilterCondition>(
            (final h) => FilterCondition.contains(
              property: 'hashesListJoined',
              value: h,
            ),
          )
          .toList();
      return isar.uploadedObjects
          .buildQuery<UploadedObject>(filter: FilterGroup.or(filters))
          .findFirst();
    });
  }
}
