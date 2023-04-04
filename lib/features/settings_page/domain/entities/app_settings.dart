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
  });

  const AppSettings.defaultValues()
      :
        // Minimum number of hash matches to be considered stable
        stableRequirement = 1,
        darkTheme = false,
        showZeroAssets = defaultShowZeroAssets;

  @HiveField(0)
  final int stableRequirement;

  @HiveField(1)
  final bool darkTheme;

  @HiveField(2) // TODO SET DEFAULT VALUES INSTEAD OF SELF_VALIDATING
  final bool? showZeroAssets;

  AppSettings selfValidate() {
    final newShowZeroAssets = showZeroAssets ?? defaultShowZeroAssets;

    return this.copyWith(
      showZeroAssets: newShowZeroAssets,
    );
  }

  static const defaultShowZeroAssets = true;
}
