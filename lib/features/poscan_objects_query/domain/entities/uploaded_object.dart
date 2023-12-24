class UploadedObject {
  final Map<dynamic, dynamic> raw;
  final int id;
  final String owner;
  final List<String> hashes;
  final String status;

  const UploadedObject({
    required this.id,
    required this.raw,
    required this.owner,
    required this.hashes,
    required this.status,
  });
}

class UploadedObjectFabric {
  final int id;
  final Map<dynamic, dynamic> raw;

  const UploadedObjectFabric({
    required this.id,
    required this.raw,
  });

  String owner() {
    return raw['owner'] as String;
  }

  List<String> hashes() {
    return (raw['hashes'] as List<dynamic>)
        .map((final dynamic e) => e.toString())
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
    );
  }
}
