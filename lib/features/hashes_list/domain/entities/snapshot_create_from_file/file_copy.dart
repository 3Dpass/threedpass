import 'dart:io';

import 'package:threedpass/core/utils/hash_file.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/features/hashes_list/domain/entities/objects_directory.dart';

/// Copy object file to support files directory
class FileCopy {
  final ObjectsDirectory objectsDirectory;

  FileCopy(this.objectsDirectory);

  /// Copies file content and returns path to the new file.
  Future<String> write(final String oldFilePath) async {
    final file = File(oldFilePath);
    // Hash of the old file's content is the name of the new file
    final rawObjName = hashFile(oldFilePath).toString();

    // init dir
    objectsDirectory.createSync();

    // Rename file to avoid collisions
    final newFilePath = objectsDirectory.path + rawObjName;
    logger.t('newFilePath $newFilePath');

    // We don't create new file if it's already exists
    final objAlreadyExists = File(newFilePath).existsSync();

    if (!objAlreadyExists) {
      // Copy contents. [File.copy()] operation does not work! So do this way.
      final oldContent = file.readAsStringSync();
      final newFile = File(newFilePath);
      newFile.createSync();
      newFile.writeAsStringSync(oldContent);
    }

    return rawObjName;
  }
}
