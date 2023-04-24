import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class BlockDateTimeW extends StatelessWidget {
  const BlockDateTimeW(this.dateTime, {super.key});
  // final GDateTime dateTime;
  final DateTime dateTime;
  @override
  Widget build(final BuildContext context) {
    // final dt = DateTime.parse(dateTime.value);
    final fmt = DateFormat('kk:mm – dd-MM-yyyy').format(dateTime);
    return D3pBodyMediumText(
      fmt,
      translate: false,
    );
  }
}
