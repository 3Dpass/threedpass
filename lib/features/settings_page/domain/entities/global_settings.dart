import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/wallet_settings.dart';

part 'global_settings.g.dart';

@CopyWith()
@HiveType(typeId: 4)
class GlobalSettings {
  const GlobalSettings({
    required this.scanSettings,
    required this.walletSettings,
    required this.previewSettings,
    required this.appSettings,
  });

  GlobalSettings.defaultValues()
      : scanSettings = const ScanSettings.defaultValues(),
        walletSettings = const WalletSettings.defaultValues(),
        appSettings = const AppSettings.defaultValues(),
        previewSettings = const PreviewSettings.defaultValues();

  @HiveField(3)
  final AppSettings appSettings;

  @HiveField(2)
  final PreviewSettings previewSettings;

  @HiveField(0)
  final ScanSettings scanSettings;

  @HiveField(1)
  final WalletSettings walletSettings;

  GlobalSettings selfValidate() {
    final newScan = scanSettings.selfValidate();
    // final newApp = appSettings.selfValidate();
    // walletSettings.selfCheck();
    // previewSettings.selfCheck();

    return this.copyWith(
      scanSettings: newScan,
      // appSettings: newApp,
    );
  }
}
