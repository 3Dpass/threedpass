extension ToMapStringDynamic on Map<dynamic, dynamic> {
  Map<String, dynamic> toMapStringDynamic() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};

    for (final key in this.keys) {
      jsonData[key.toString()] = this[key];
    }

    return jsonData;
  }
}
