final initialBlockDate = DateTime(2022, DateTime.august, 30, 21, 36);

DateTime dateTimeFromBlockNumber(int blockNumber) =>
    initialBlockDate.add(Duration(minutes: blockNumber));

int blockNumberFromDateTime(DateTime dateTime) =>
    (dateTime.difference(initialBlockDate).inMinutes).toInt();
