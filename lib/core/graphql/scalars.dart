String dateTimeToJson(final DateTime data) {
  return data.toIso8601String();
}

DateTime dateTimeFromJson(final dynamic data) {
  return DateTime.parse(data as String);
}
