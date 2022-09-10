import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

class HiveSettingsStore extends HiveUniversalStore<GlobalSettings> {
  HiveSettingsStore() : super(boxName: 'settings');

  static final _defaultValue = GlobalSettings.defaultValues();

  GlobalSettings getSettings() {
    final currentData = getAt(0);
    if (currentData != null) {
      return currentData;
    } else {
      setSettings(_defaultValue);
      return _defaultValue;
    }
  }

  Future<void> setSettings(GlobalSettings config) async {
    return await putAt0(config);
  }
}
