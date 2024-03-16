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
  @HiveField(5, defaultValue: TransBytesMode.random)
  final TransBytesMode transBytesMode;

  static const String noneTransBytesKey = 'None';

  const ScanSettings({
    required this.gridSize,
    required this.nSections,
    required this.algorithm,
    required this.libVersion,
    required this.transBytes,
    required this.transBytesMode,
  });

  const ScanSettings.defaultValues()
      : gridSize = 8,
        algorithm = AlgorithmMaster.defaultAlgo,
        nSections = 12,
        libVersion = 'unknown',
        transBytesMode = TransBytesMode.random,
        transBytes = '';

  @override
  List<Object?> get props => [
        gridSize,
        algorithm,
        nSections,
        libVersion,
      ];

  ScanSettings selfValidate() {
    String algorithm = this.algorithm;
    if (!AlgorithmMaster.list.contains(algorithm)) {
      // If algo is deprecated, migrate slowly
      algorithm = AlgorithmMaster.defaultAlgo;
    }

    return this.copyWith(
      algorithm: algorithm,
    );
  }
}

@HiveType(typeId: 10)
enum TransBytesMode {
  @HiveField(0)
  none,

  @HiveField(1)
  random,

  @HiveField(2)
  specific,
}
