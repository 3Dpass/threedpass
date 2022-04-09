import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

abstract class SettingsRepository {
  SettingsConfig getConfig();
  Future<void> setConfig(SettingsConfig config);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveSettingsStore hiveSettingsStore;

  const SettingsRepositoryImpl({
    required this.hiveSettingsStore,
  });
  @override
  SettingsConfig getConfig() {
    return hiveSettingsStore.getSettings();
  }

  @override
  Future<void> setConfig(SettingsConfig config) async {
    return await hiveSettingsStore.setSettings(config);
  }
}
