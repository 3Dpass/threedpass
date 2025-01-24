import 'dart:async';

import 'package:rust_lzss/rust_lzss.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

abstract class SettingsRepository {
  Future<GlobalSettings> getConfig();
  Future<void> setConfig(final GlobalSettings config);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveSettingsStore hiveSettingsStore;

  const SettingsRepositoryImpl({
    required this.hiveSettingsStore,
  });
  @override
  Future<GlobalSettings> getConfig() async {
    final current = await hiveSettingsStore.getSettings();

    final v = await packageVersion();

    return current.copyWith(
      scanSettings: current.scanSettings.copyWith(libVersion: v),
    );
  }

  @override
  Future<void> setConfig(final GlobalSettings config) async {
    return hiveSettingsStore.setSettings(config);
  }
}
