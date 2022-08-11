part of 'settings_page_cubit.dart';

abstract class SettingsConfigState {
  const SettingsConfigState();

  ScanSettings get settings;
}

class SettingsConfigInitial extends SettingsConfigState {
  const SettingsConfigInitial();

  static const _default = DefaultSettingsConfig();

  @override
  ScanSettings get settings => _default;
}

class SettingsConfigLoaded extends SettingsConfigState {
  @override
  final ScanSettings settings;

  const SettingsConfigLoaded({
    required this.settings,
  });
}
