import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/text/d3p_body_medium_text.dart';

class UTCTime extends StatelessWidget {
  const UTCTime({required this.dateTime, required this.formatter, super.key});

  final DateTime? dateTime;
  final DateFormat formatter;

  @override
  Widget build(final BuildContext context) {
    if (dateTime == null) {
      return const D3pBodyMediumText(
        'null',
        translate: false,
      );
    }

    final medium = Theme.of(context).customTextStyles.d3pBodyMedium;
    final small = Theme.of(context).customTextStyles.d3pBodySmall;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: formatter.format(dateTime!),
            style: medium,
          ),
          WidgetSpan(
            child: Text(
              ' UTC',
              textScaleFactor: 0.8,
              style: small.copyWith(
                color: D3pColors.disabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
