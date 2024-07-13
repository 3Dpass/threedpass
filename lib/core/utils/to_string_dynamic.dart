extension ToStrDyn on Map<dynamic, dynamic> {
  Map<String, dynamic> toStringDynamic() => this.map<String, dynamic>(
        (final dynamic key, final dynamic value) =>
            MapEntry<String, dynamic>(key.toString(), value),
      );
}
