final initialBlockDate = DateTime(2022, DateTime.august, 31, 0, 36, 30);

DateTime dateTimeFromBlockNumber(int blockNumber) =>
    initialBlockDate.add(Duration(minutes: blockNumber));

int blockNumberFromDateTime(DateTime dateTime) =>
    (dateTime.difference(initialBlockDate).inMinutes).toInt();
