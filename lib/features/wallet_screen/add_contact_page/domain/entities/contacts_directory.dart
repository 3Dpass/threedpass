import 'dart:io';

class ContactsDirectory {
  static const String localPath = '/contacts/';

  final String path;

  const ContactsDirectory(final String documentsPath)
      : path = documentsPath + localPath;

  void createSync() {
    final dir = Directory(path);
    dir.createSync();
  }
}
