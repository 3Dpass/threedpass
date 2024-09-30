extension ToMapStringDynamic on Map<dynamic, dynamic> {
  Map<String, dynamic> toMapStringDynamic() => this.map<String, dynamic>(
        (final dynamic key, final dynamic value) =>
            MapEntry<String, dynamic>(key.toString(), value),
      );
}
