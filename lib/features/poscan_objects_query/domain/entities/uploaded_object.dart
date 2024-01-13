import 'package:hive/hive.dart';

part 'uploaded_object.g.dart';

@HiveType(typeId: 9)
class UploadedObject {
  @HiveField(0)
  final Map<dynamic, dynamic> raw;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String owner;
  @HiveField(3)
  final List<String> hashes;
  @HiveField(4)
  final String status;
  @HiveField(5)
  final DateTime cacheDate;

  const UploadedObject({
    required this.id,
    required this.raw,
    required this.owner,
    required this.hashes,
    required this.status,
    required this.cacheDate,
  });
}
