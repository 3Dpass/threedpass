import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Copy object file to support files directory
class FileCopy {
  /// Copies file content and returns path to the new file.
  Future<String> write(final String oldFilePath) async {
    final file = File(oldFilePath);
    final rawObjName = oldFilePath.split('/').last;

    final Directory supportDir = await getApplicationDocumentsDirectory();
    final Directory objects = Directory(supportDir.path + '/objects');
    objects.createSync();

    // Rename file to avoud collisions
    final newFilePath = supportDir.path +
        '/objects/' +
        rawObjName; // TODO Write objects path as constant and delete objects
    print('newFilePath $newFilePath');

    // Copy contents. [File.copy] operation does not work! So do this way.
    print('Check old file exists: ${file.existsSync()}');
    final oldContent = file.readAsStringSync();
    final newFile = File(newFilePath);
    print('1');
    newFile.createSync();
    print('2');
    newFile.writeAsStringSync(oldContent);
    print('3');

    return rawObjName;
  }
}
