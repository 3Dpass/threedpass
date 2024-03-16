import 'package:hive/hive.dart';
import 'package:threedpass/core/polkawallet/utils/log.dart';

part 'uploaded_object.g.dart';

@HiveType(typeId: 9)
class UploadedObject {
  @HiveField(0)
  final Map<dynamic, dynamic> raw;
  @HiveField(1)
  final int id;
  // @HiveField(2)
  // final String owner;
  // @HiveField(3)
  // final List<String> hashes;
  // @HiveField(4)
  // final String status;
  @HiveField(5)
  final DateTime cacheDate;
  // @HiveField(6)
  // final DateTime? statusDateUTC;

  const UploadedObject({
    required this.id,
    required this.raw,
    required this.cacheDate,
  });

  DateTime? get statusDateUTC {
    try {
      final dynamic values =
          (raw['state'] as Map).values.first; // Can be 685,523 or [793,188, 0]
      String rawDate = '';
      if (values is String) {
        rawDate = values;
      } else if (values is List<dynamic>) {
        rawDate = values.first.toString();
      }
      final d1 = rawDate.replaceAll(',', '');
      final d2 = int.parse(d1);
      final initialDate = DateTime(2022, DateTime.august, 30, 21, 36);
      final realStatus = initialDate.add(Duration(minutes: d2));

      return realStatus;
    } on Object catch (e) {
      logE('UploadedObject statusDateUTC ' + e.toString() + ' $raw');
      return null;
    }
  }

  String get owner => raw['owner'] as String;

  List<String> get hashes => (raw['hashes'] as List<dynamic>)
      .map((final dynamic e) => e.toString().substring(2))
      .toList();

  String get status => (raw['state'] as Map).keys.first.toString();
}
