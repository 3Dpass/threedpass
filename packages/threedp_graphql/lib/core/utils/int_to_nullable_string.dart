extension IntToStrNullable on int? {
  String? toNullableString() {
    if (this == null) {
      return null;
    } else {
      return toString();
    }
  }
}
