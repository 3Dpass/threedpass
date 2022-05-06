import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'settings_config.g.dart';

@CopyWith()
@HiveType(typeId: 1)
class SettingsConfig extends Equatable {
  @HiveField(0)
  final int gridSize;
  @HiveField(1)
  final Algorithm algorithm;
  @HiveField(2)
  final int nSections;

  const SettingsConfig({
    required this.gridSize,
    required this.nSections,
    required this.algorithm,
  });

  @override
  List<Object?> get props => [
        gridSize,
        algorithm,
        nSections,
      ];
}

@HiveType(typeId: 2)
enum Algorithm {
  @HiveField(0)
  spectrum,
  @HiveField(1)
  grid,
}
