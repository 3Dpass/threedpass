import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';

class DefaultSettingsConfig extends ScanSettings {
  const DefaultSettingsConfig()
      : super(
          gridSize: 7,
          nSections: 10,
          algorithm: Algorithm.grid,
        );
}
