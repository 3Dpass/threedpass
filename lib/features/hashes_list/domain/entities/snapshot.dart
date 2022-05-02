import 'package:hive/hive.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';

part 'snapshot.g.dart';

@CopyWith()
@HiveType(typeId: 0)
class Snapshot {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime stamp;

  @HiveField(2)
  final List<String> hashes;

  @HiveField(3)
  final String? externalPathToObj;

  const Snapshot({
    required this.name,
    required this.stamp,
    required this.hashes,
    this.externalPathToObj,
  });

  String get shareText => hashes.join('\n');

  bool belongsToObject(HashObject hashObject) {
    final Set<String> setOfHashes = {};
    for (var snap in hashObject.snapshots) {
      setOfHashes.addAll(snap.hashes);
    }

    bool hasCommonHash = false;
    for (var hash in hashes) {
      if (setOfHashes.contains(hash)) {
        hasCommonHash = true;
      }
    }

    return hasCommonHash;
  }
}
