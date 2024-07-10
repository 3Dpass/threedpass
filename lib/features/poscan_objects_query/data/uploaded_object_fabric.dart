part of 'storage_poscan_repo.dart';

class _UploadedObjectFabric {
  final int id;
  final Map<dynamic, dynamic> raw;

  const _UploadedObjectFabric({
    required this.id,
    required this.raw,
  });

  UploadedObject object() {
    return UploadedObject.fromJson(
      raw.map<String, dynamic>(
        (final dynamic key, final dynamic value) =>
            MapEntry<String, dynamic>(key.toString(), value),
      ),
      DateTime.now(),
      id,
    );
  }
}
