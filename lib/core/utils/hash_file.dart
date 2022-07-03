import 'dart:io';

import 'package:threedpass/core/utils/hash2.dart';

int hashFile(String path) {
  final file = File(path);
  final bytes = file.readAsStringSync();
  return hash2(0, bytes);
}
