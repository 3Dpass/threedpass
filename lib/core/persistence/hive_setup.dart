import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

Future<void> hiveSetup() async {
  Hive.registerAdapter(HashObjectAdapter());
  Hive.registerAdapter(SnapshotAdapter());
  Hive.registerAdapter(SettingsConfigAdapter());
  Hive.registerAdapter(AlgorithmAdapter());
  Directory defaultDirectory = await getApplicationDocumentsDirectory();
  Hive.init(defaultDirectory.path + '/storages');
}
