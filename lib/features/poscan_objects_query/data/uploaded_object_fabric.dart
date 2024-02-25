part of 'storage_poscan_repo.dart';

class _UploadedObjectFabric {
  final int id;
  final Map<dynamic, dynamic> raw;

  const _UploadedObjectFabric({
    required this.id,
    required this.raw,
  });

  UploadedObject object() {
    return UploadedObject(
      id: id,
      raw: raw,
      cacheDate: DateTime.now(),
    );
  }
}
