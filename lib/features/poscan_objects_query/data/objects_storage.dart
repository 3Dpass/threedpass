import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class ObjectsStore {
  ObjectsStore();

  bool isInitialized = false;
  late Isar isar;

  Stream<void> get objectsChanged => isar.uploadedObjects.watchLazy();

  Future<void> open(final int ss58) async {
    isInitialized = false;

    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UploadedObjectSchema],
      directory: dir.path,
      name: 'isar_objects_cache_$ss58',
    );

    isInitialized = true;
  }

  Future<void> clear() async {
    return afterInit(() async => isar.clear());
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
    if (isInitialized) {
      return func();
    } else {
      logE('ObjectsStore is not initialized', StackTrace.current);
      throw Exception('ObjectsStore is not initialized');
    }
  }
}
