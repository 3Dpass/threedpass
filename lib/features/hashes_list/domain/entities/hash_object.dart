import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/core/utils/hash2.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

part 'hash_object.g.dart';

@CopyWith()
@HiveType(typeId: 3)
class HashObject {
  HashObject({
    required this.name,
    required this.snapshots,
    required this.localId,
  });

  HashObject.create({
    required this.name,
    required this.snapshots,
  }) : localId = Random().nextInt(1 << 32);

  @HiveField(0)
  final int localId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Snapshot> snapshots;

  @override
  bool operator ==(other) {
    if (other is HashObject) {
      return localId == other.localId;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => hash2(0, localId);

  Iterable<String> get stableHashes {
    final Map<String, int> hashFreq = {};

    for (var snapshot in snapshots) {
      for (var hash in snapshot.hashes) {
        if (hashFreq[hash] == null) {
          hashFreq[hash] = 1;
        } else {
          final freq = hashFreq[hash]!;
          hashFreq[hash] = freq + 1;
        }
      }
    }

    return hashFreq.keys.where((hash) => hashFreq[hash]! > 2);
  }
}
