import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
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
  //  _stableHashes = calcStable();

  @HiveField(0)
  final int localId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Snapshot> snapshots;

  // List<String> get stableHashes => _stableHashes;

  // List<String> _stableHashes;

  // static List<String> calcStable() => [];

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

  // List<String> get stableHashes {
  //   final res = <String>[];
  //   final Map<String, int> hashFreq = {};

  //   for ()
  //   return res;
  // }
}
