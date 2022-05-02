import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';

part 'hash_object.g.dart';

@CopyWith()
@HiveType(typeId: 3)
class HashObject extends Equatable {
  const HashObject({
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
  List<Object?> get props => [localId];
}
