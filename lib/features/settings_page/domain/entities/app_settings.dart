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
    required this.pinCode,
  });

  const AppSettings.defaultValues()
      :
        // Minimum number of hash matches to be considered stable
        stableRequirement = 3,
        darkTheme = false,
        pinCode = '',
        showZeroAssets = defaultShowZeroAssets;

  @HiveField(0)
  final int stableRequirement;

  @HiveField(1)
  final bool darkTheme;

  @HiveField(
    2,
    defaultValue: false,
  )
  final bool showZeroAssets;

  @HiveField(3, defaultValue: '')
  final String pinCode;

  static const defaultShowZeroAssets = true;
}
