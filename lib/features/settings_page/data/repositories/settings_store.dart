import 'package:threedpass/core/errors/storage_error.dart';
import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/core/utils/either.dart';
import 'package:threedpass/features/settings_page/data/models/default_settings_config.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

class HiveSettingsStore extends HiveUniversalStore<SettingsConfig> {
  HiveSettingsStore() : super(boxName: 'settings');

  SettingsConfig getSettings() {
    final currentData = getAt(0);
    if (currentData != null) {
      return currentData;
    } else {
      setSettings(DefaultSettingsConfig());
      return DefaultSettingsConfig();
    }
  }

  Future<void> setSettings(SettingsConfig config) async {
    return await putAt0(config);
  }
}
