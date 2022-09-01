import 'package:bloc/bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/repositories/settings_repository.dart';

class SettingsConfigCubit extends Cubit<GlobalSettings> {
  SettingsConfigCubit({
    required GlobalSettings config,
    required this.settingsRepository,
  }) : super(config);

  final SettingsRepository settingsRepository;

  // void init() {
  //   final config = settingsRepository.getConfig();
  //   emit(SettingsConfigLoaded(settings: config));
  // }

  void updateSettings(GlobalSettings config) {
    settingsRepository.setConfig(config);
    emit(config);
  }
}
