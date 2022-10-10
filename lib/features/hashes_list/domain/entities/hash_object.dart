import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';
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

  /// Minimum number of hash matches to be considered stable
  static const int minRequirement = 1;

  @HiveField(0)
  final int localId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Snapshot> snapshots;

  @override
  bool operator ==(final dynamic other) {
    if (other is HashObject) {
      return localId == other.localId;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => hash2(0, localId);

  Set<int> get fileHashes {
    final res = <int>{};
    for (final snapshot in snapshots) {
      res.add(snapshot.fileHash);
    }
    return res;
  }

  /// if object contains snapshot with all equal hashes, but any name
  bool containsSnapshot(final Snapshot snapshot) {
    for (final s in snapshots) {
      if (listEquals(s.hashes, snapshot.hashes)) {
        return true;
      }
    }

    return false;
  }

  /// To get self object self hashes
  List<String> get stableHashes {
    final hashFreq = _hashFreq;

    return hashFreq.keys
        .where((final hash) => hashFreq[hash]! > minRequirement)
        .toList();
  }

  /// When you need to compare external snapshot with object stable hashes
  List<String> stableHashesPlusNew(final Snapshot snapshot) {
    final hashFreq = _hashFreq;

    for (final hash in snapshot.hashes) {
      if (hashFreq[hash] == null) {
        hashFreq[hash] = 1;
      } else {
        final freq = hashFreq[hash]!;
        hashFreq[hash] = freq + 1;
      }
    }

    return hashFreq.keys
        .where((final hash) => hashFreq[hash]! > minRequirement)
        .toList();
  }

  /// How many times each hash appears in all snapshots
  Map<String, int> get _hashFreq {
    final Map<String, int> hashFreq = {};

    for (final snapshot in snapshots) {
      for (final hash in snapshot.hashes) {
        if (hashFreq[hash] == null) {
          hashFreq[hash] = 1;
        } else {
          final freq = hashFreq[hash]!;
          hashFreq[hash] = freq + 1;
        }
      }
    }

    return hashFreq;
  }
}
