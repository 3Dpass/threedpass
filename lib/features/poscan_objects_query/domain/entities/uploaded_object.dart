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
  // @HiveField(6)
  // final DateTime? statusDateUTC;

  const UploadedObject({
    required this.id,
    required this.raw,
    required this.owner,
    required this.hashes,
    required this.status,
    required this.cacheDate,
    // required this.statusDateUTC,
  });

  DateTime get statusDateUTC {
    final d1 =
        (raw['state'] as Map).values.first.toString().replaceAll(',', '');
    final d2 = int.parse(d1);
    final initialDate = DateTime(2022, DateTime.august, 30, 21, 36);
    final realStatus = initialDate.add(Duration(minutes: d2));

    return realStatus;
  }
}
