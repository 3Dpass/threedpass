import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

part 'hash_object.g.dart';

@CopyWith()
@HiveType(typeId: 1)
class HashObject {
  HashObject({
    required this.name,
    required this.snapshots,
  }) : localId = Random().nextInt(1 << 32);

  @HiveField(0)
  late final int localId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<Snapshot> snapshots;
}
