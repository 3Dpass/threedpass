part of './snapshot_create_from_file.dart';

class _TransBytes {
  final ScanSettings scanSettings;

  _TransBytes({
    required this.scanSettings,
  });

  Future<String> calc() async {
    switch (scanSettings.transBytesMode) {
      case TransBytesMode.none:
        return '';
      case TransBytesMode.random:
        return RandomHex.generate(8);
      case TransBytesMode.specific:
        return scanSettings.transBytes;
    }
  }
}
