import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'scan_settings.g.dart';

@CopyWith()
@HiveType(typeId: 1)
class ScanSettings extends Equatable {
  @HiveField(0)
  final int gridSize;
  @HiveField(1)
  final Algorithm algorithm;
  @HiveField(2)
  final int nSections;
  @HiveField(3)
  final String libVersion;

  const ScanSettings({
    required this.gridSize,
    required this.nSections,
    required this.algorithm,
    required this.libVersion,
  });

  const ScanSettings.defaultValues()
      : gridSize = 7,
        algorithm = Algorithm.grid2d,
        nSections = 10,
        libVersion = 'unknown';

  @override
  List<Object?> get props => [
        gridSize,
        algorithm,
        nSections,
        libVersion,
      ];
}

@HiveType(typeId: 2)
enum Algorithm {
  @HiveField(0)
  spectrum,
  @HiveField(1)
  grid2d,
}
