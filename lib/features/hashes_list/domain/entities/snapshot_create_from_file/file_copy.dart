import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';

/// Copy object file to support files directory
class FileCopy {
  final ObjectsDirectory objectsDirectory;

  FileCopy(this.objectsDirectory);

  /// Copies file content and returns path to the new file.
  Future<String> write(final String oldFilePath) async {
    final file = File(oldFilePath);
    final rawObjName = hashFile(oldFilePath).toString();

    objectsDirectory.createSync();

    // Rename file to avoid collisions
    final newFilePath = objectsDirectory.path + rawObjName;
    print('newFilePath $newFilePath');

    final objAlreadyExists = File(newFilePath).existsSync();
    // print('objAlreadyExists $objAlreadyExists');
    if (!objAlreadyExists) {
      // Copy contents. [File.copy()] operation does not work! So do this way.
      // print('Check old file exists: ${file.existsSync()}');
      final oldContent = file.readAsStringSync();
      final newFile = File(newFilePath);
      // print('1');
      newFile.createSync();
      // print('2');
      newFile.writeAsStringSync(oldContent);
      // print('3');
    }

    return rawObjName;
  }
}
