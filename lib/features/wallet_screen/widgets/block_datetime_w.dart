import 'package:flutter/material.dart';
import 'package:threedpass/core/utils/formatters.dart';
import 'package:threedpass/core/widgets/utc_time.dart';

class BlockDateTimeW extends StatelessWidget {
  const BlockDateTimeW(this.dateTime, {super.key});

  final DateTime? dateTime;
  @override
  Widget build(final BuildContext context) {
    // final dt = DateTime.parse(dateTime.value);
    if (dateTime != null) {
      return UTCTime(
        dateTime: dateTime,
        formatter: Formatters.transferDateFormat,
      );
    } else {
      return const SizedBox();
    }
  }
}
