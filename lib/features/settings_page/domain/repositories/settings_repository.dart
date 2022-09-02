import 'package:calc/calc.dart';
import 'package:threedpass/features/settings_page/data/repositories/settings_store.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

abstract class SettingsRepository {
  Future<GlobalSettings> getConfig();
  Future<void> setConfig(GlobalSettings config);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final HiveSettingsStore hiveSettingsStore;

  const SettingsRepositoryImpl({
    required this.hiveSettingsStore,
  });
  @override
  Future<GlobalSettings> getConfig() async {
    final current = hiveSettingsStore.getSettings();

    final v = await Calc2.getVersion();

    return current.copyWith(
      scanSettings: current.scanSettings.copyWith(libVersion: v),
    );
  }

  @override
  Future<void> setConfig(GlobalSettings config) async {
    return await hiveSettingsStore.setSettings(config);
  }
}
