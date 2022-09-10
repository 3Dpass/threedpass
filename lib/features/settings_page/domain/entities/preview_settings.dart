import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'preview_settings.g.dart';

@CopyWith()
@HiveType(typeId: 6)
class PreviewSettings {
  const PreviewSettings({
    required this.pixelRatio,
    required this.antialias,
  });

  const PreviewSettings.defaultValues()
      : pixelRatio = 1,
        antialias = true;

  @HiveField(0)
  final double pixelRatio;
  @HiveField(1)
  final bool antialias;
}
