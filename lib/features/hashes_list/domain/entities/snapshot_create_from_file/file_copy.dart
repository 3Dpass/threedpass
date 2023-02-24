import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Copy object file to support files directory
class FileCopy {
  /// Copies file content and returns path to the new file.
  Future<String> write(final String oldFilePath) async {
    final file = File(oldFilePath);
    final Directory supportDir = await getApplicationSupportDirectory();

    // Rename file to avoud collisions
    final newFileName = oldFilePath.replaceAll('/', '|');
    final newFilePath = supportDir.path + newFileName;

    // Copy contents. [File.copy] operation does not work! So do this way.
    final oldContent = file.readAsStringSync();
    final newFile = File(newFilePath);
    newFile.writeAsStringSync(oldContent);

    return newFilePath;
  }
}
