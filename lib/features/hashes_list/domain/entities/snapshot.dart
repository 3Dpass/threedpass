import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:calc/calc.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:threedpass/common/logger.dart';
import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/utils/hash2.dart';
import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/core/utils/pair.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/bloc/hashes_list_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';
import 'package:threedpass/generated/bindings.dart';

part 'snapshot.g.dart';
part 'snapshot_create_from_file.dart';

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

  @HiveField(4)
  final SettingsConfig? settingsConfig;

  @HiveField(5)
  final int fileHash;

  const Snapshot({
    required this.name,
    required this.stamp,
    required this.hashes,
    this.externalPathToObj,
    required this.settingsConfig,
    required this.fileHash,
  });

  String get shareText => hashes.join('\n');

  @override
  bool operator ==(other) {
    if (other is Snapshot) {
      return name == other.name && listEquals(hashes, other.hashes);
    } else {
      return false;
    }
  }

  @override
  int get hashCode => hash2(name.hashCode, hashes.hashCode);

  bool belongsToObject(HashObject hashObject) {
    // check file hashes
    if (hashObject.fileHashes.contains(fileHash)) {
      return true;
    }

    // check snapshot hashes
    final Set<String> setOfHashes = {};
    // get all hashes from all snapshots
    for (var snap in hashObject.snapshots) {
      setOfHashes.addAll(snap.hashes);
    }

    // find at least one common hash
    bool hasCommonHash = false;
    for (var hash in hashes) {
      if (setOfHashes.contains(hash)) {
        hasCommonHash = true;
      }
    }

    return hasCommonHash;
  }
}
