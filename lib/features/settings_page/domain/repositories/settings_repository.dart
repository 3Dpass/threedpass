import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

abstract class SettingsRepository {
  GlobalSettings getConfig();
  Future<void> setConfig(GlobalSettings config);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveSettingsStore hiveSettingsStore;

  const SettingsRepositoryImpl({
    required this.hiveSettingsStore,
  });
  @override
  GlobalSettings getConfig() {
    return hiveSettingsStore.getSettings();
  }

  @override
  Future<void> setConfig(GlobalSettings config) async {
    return await hiveSettingsStore.setSettings(config);
  }
}
