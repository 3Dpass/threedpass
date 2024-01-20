part of 'storage_poscan_repo.dart';

class _UploadedObjectFabric {
  final int id;
  final Map<dynamic, dynamic> raw;

  const _UploadedObjectFabric({
    required this.id,
    required this.raw,
  });

  String owner() {
    return raw['owner'] as String;
  }

  List<String> hashes() {
    return (raw['hashes'] as List<dynamic>)
        .map((final dynamic e) => e.toString().substring(2))
        .toList();
  }

  String status() {
    return (raw['state'] as Map).keys.first.toString();
  }

  UploadedObject object() {
    return UploadedObject(
      id: id,
      raw: raw,
      owner: owner(),
      hashes: hashes(),
      status: status(),
      cacheDate: DateTime.now(),
    );
  }
}
