import 'dart:async';

import 'package:threedpass/core/persistence/hive_universal_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';

class HiveSettingsStore extends HiveUniversalStore<GlobalSettings> {
  HiveSettingsStore() : super(boxName: 'settings');

  static final _defaultValue = GlobalSettings.defaultValues();

  Future<GlobalSettings> getSettings() async {
    final currentData = getAt(0);
    if (currentData != null) {
      final correctData = currentData.selfValidate();
      return correctData;
    } else {
      unawaited(setSettings(_defaultValue));
      return _defaultValue;
    }
  }

  Future<void> setSettings(final GlobalSettings config) async {
    return putAt0(config);
  }
}
