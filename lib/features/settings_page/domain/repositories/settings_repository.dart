import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

abstract class SettingsRepository {
  ScanSettings getConfig();
  Future<void> setConfig(ScanSettings config);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveSettingsStore hiveSettingsStore;

  const SettingsRepositoryImpl({
    required this.hiveSettingsStore,
  });
  @override
  ScanSettings getConfig() {
    return hiveSettingsStore.getSettings();
  }

  @override
  Future<void> setConfig(ScanSettings config) async {
    return await hiveSettingsStore.setSettings(config);
  }
}
