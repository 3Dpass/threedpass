import 'package:bloc/bloc.dart';
import 'package:threedpass/features/settings_page/data/models/default_settings_config.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

part 'settings_page_state.dart';

class SettingsConfigCubit extends Cubit<SettingsConfigState> {
  SettingsConfigCubit({
    required this.settingsRepository,
  }) : super(const SettingsConfigInitial());

  final SettingsRepository settingsRepository;

  void init() {
    final config = settingsRepository.getConfig();
    emit(SettingsConfigLoaded(settings: config));
  }

  void updateSettings(ScanSettings config) {
    settingsRepository.setConfig(config);
    emit(SettingsConfigLoaded(settings: config));
  }
}
