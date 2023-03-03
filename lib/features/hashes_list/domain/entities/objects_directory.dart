import 'dart:io';

class ObjectsDirectory {
  static const String localPath = '/objects/';

  final String path;

  const ObjectsDirectory(final String documentsPath)
      : path = documentsPath + localPath;

  void createSync() {
    final dir = Directory(path);
    dir.createSync();
  }
}
