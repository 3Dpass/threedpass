part of './snapshot_create_from_file.dart';

class _TransBytes {
  final ScanSettings scanSettings;

  _TransBytes({
    required this.scanSettings,
  });

  Future<String> calc() async {
    if (scanSettings.transBytesMode == TransBytesMode.none) {
      return '';
    }

    final String userTransBytes = scanSettings.transBytes;

    if (userTransBytes.isNotEmpty) {
      return userTransBytes;
    }

    final randomTransBytes = RandomHex.generate(8);
    return randomTransBytes;
  }
}
