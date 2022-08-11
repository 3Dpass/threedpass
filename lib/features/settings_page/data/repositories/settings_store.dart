import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/settings_page/data/models/default_settings_config.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

class HiveSettingsStore extends HiveUniversalStore<ScanSettings> {
  HiveSettingsStore() : super(boxName: 'settings');

  ScanSettings getSettings() {
    final currentData = getAt(0);
    if (currentData != null) {
      return currentData;
    } else {
      setSettings(const DefaultSettingsConfig());
      return const DefaultSettingsConfig();
    }
  }

  Future<void> setSettings(ScanSettings config) async {
    return await putAt0(config);
  }
}
