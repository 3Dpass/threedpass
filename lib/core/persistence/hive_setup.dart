import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:threedpass/features/hashes_list/domain/entities/hash_object.dart';
import 'package:threedpass/features/hashes_list/domain/entities/snapshot.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';
import 'package:threedpass/features/wallet_screen/add_contact_page/domain/entities/contact.dart';

Future<void> hiveSetup() async {
  // local snapshots
  Hive.registerAdapter<HashObject>(HashObjectAdapter());
  Hive.registerAdapter<Snapshot>(SnapshotAdapter());
  // settings
  Hive.registerAdapter<GlobalSettings>(GlobalSettingsAdapter());
  Hive.registerAdapter<ScanSettings>(ScanSettingsAdapter());
  Hive.registerAdapter<WalletSettings>(WalletSettingsAdapter());
  Hive.registerAdapter<PreviewSettings>(PreviewSettingsAdapter());
  Hive.registerAdapter<AppSettings>(AppSettingsAdapter());
  Hive.registerAdapter<Contact>(ContactAdapter());
  Hive.registerAdapter<TransBytesMode>(TransBytesModeAdapter());

  final Directory defaultDirectory = await getApplicationDocumentsDirectory();
  Hive.init(defaultDirectory.path + '/storages');
}
