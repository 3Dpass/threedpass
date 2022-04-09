import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';

class DefaultSettingsConfig extends SettingsConfig {
  const DefaultSettingsConfig()
      : super(
          gridSize: 7,
          nSections: 10,
          algorithm: Algorithm.Grid,
        );
}
