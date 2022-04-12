part of 'settings_page_cubit.dart';

abstract class SettingsConfigState {
  const SettingsConfigState();

  SettingsConfig get settings;
}

class SettingsConfigInitial extends SettingsConfigState {
  const SettingsConfigInitial();

  static const _default = DefaultSettingsConfig();

  @override
  SettingsConfig get settings => _default;
}

class SettingsConfigLoaded extends SettingsConfigState {
  @override
  final SettingsConfig settings;

  const SettingsConfigLoaded({
    required this.settings,
  });
}
