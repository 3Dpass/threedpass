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

  const ScanSettings({
    required this.gridSize,
    required this.nSections,
    required this.algorithm,
  });

  const ScanSettings.defaultValues()
      : gridSize = 7,
        algorithm = Algorithm.grid,
        nSections = 10;

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
