import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/poscan_objects_query/domain/entities/uploaded_object.dart';

class ObjectsStore extends HiveUniversalStore<UploadedObject> {
  ObjectsStore(final int ss58)
      : super(
          boxName: ss58ToName(ss58),
        );

  static String ss58ToName(final int ss58) => 'objects_cache_$ss58';
}
