import 'package:hive/hive.dart';

part 'connection_mode.g.dart';

@HiveType(typeId: 11)
enum ConnectionMode {
  @HiveField(0)
  defaultRandom,

  @HiveField(1)
  custom,
}

extension LocalizedConnectionMode on ConnectionMode {
  String get localizedName {
    switch (this) {
      case ConnectionMode.defaultRandom:
        return 'Random trusted node';
      case ConnectionMode.custom:
        return 'Your custom node';
    }
  }
}
