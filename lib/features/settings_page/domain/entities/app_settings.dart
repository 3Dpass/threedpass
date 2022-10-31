import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'app_settings.g.dart';

@CopyWith()
@HiveType(typeId: 7)
class AppSettings {
  const AppSettings({
    required this.darkTheme,
    required this.stableRequirement,
  });

  const AppSettings.defaultValues()
      :
        // Minimum number of hash matches to be considered stable
        stableRequirement = 1,
        darkTheme = false;

  @HiveField(0)
  final int stableRequirement;

  @HiveField(1)
  final bool darkTheme;
}
