import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class MatchHyperlink extends StatelessWidget {
  const MatchHyperlink({
    required this.clickable,
    required this.mainText,
    required this.onTap,
    final Key? key,
  }) : super(key: key);

  final String clickable;
  final String mainText;
  final void Function() onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: mainText),
          TextSpan(
            text: clickable,
            style: theme.customTextStyles.matchesHyperlink,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
