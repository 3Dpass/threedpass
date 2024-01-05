import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:threedpass/features/settings_page/domain/entities/algorithm.dart';

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

  const ScanSettings.defaultValues()
      : gridSize = 8,
        algorithm = AlgorithmMaster.defaultAlgo,
        nSections = 12,
        libVersion = 'unknown',
        transBytes = '';

  @override
  List<Object?> get props => [
        gridSize,
        algorithm,
        nSections,
        libVersion,
      ];

  ScanSettings selfValidate() {
    final String algorithm = this.algorithm;
    if (!AlgorithmMaster.list.contains(algorithm)) {
      // If algo is deprecated, migrate slowly
      return const ScanSettings.defaultValues();
    }

    return this.copyWith(
      algorithm: algorithm,
    );
  }
}
