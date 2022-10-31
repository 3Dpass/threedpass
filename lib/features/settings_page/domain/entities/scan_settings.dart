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
  final String algorithm;
  @HiveField(2)
  final int nSections;
  @HiveField(3)
  final String libVersion;
  @HiveField(4)
  final String transBytes;

  const ScanSettings({
    required this.gridSize,
    required this.nSections,
    required this.algorithm,
    required this.libVersion,
    required this.transBytes,
  });

  ScanSettings.defaultValues()
      : gridSize = 8,
        algorithm = Algorithm.grid2d.name,
        nSections = 66,
        libVersion = 'unknown',
        transBytes = '';

  @override
  List<Object?> get props => [
        gridSize,
        algorithm,
        nSections,
        libVersion,
      ];
}

enum Algorithm {
  spectrum,
  grid2d,
}
