import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'app_settings.g.dart';

@CopyWith()
@HiveType(typeId: 7)
class AppSettings {
  const AppSettings({
    required this.darkTheme,
    required this.stableRequirement,
    required this.showZeroAssets,
    required this.oldPinCode,
    required this.newPinHash,
  });

  const AppSettings.defaultValues()
      :
        // Minimum number of hash matches to be considered stable
        stableRequirement = 3,
        darkTheme = false,
        oldPinCode = '',
        newPinHash = null,
        showZeroAssets = true;

  @HiveField(0)
  final int stableRequirement;

  @HiveField(1)
  final bool darkTheme;

  @HiveField(2, defaultValue: false)
  final bool showZeroAssets;

  // TODO remove after a long emough time. Deprecated 05.04.2025
  @Deprecated('')
  @HiveField(3, defaultValue: '')
  final String oldPinCode;

  @HiveField(4)
  final int? newPinHash;

  bool get isPinSet => oldPinCode.isNotEmpty || newPinHash != null;
}
