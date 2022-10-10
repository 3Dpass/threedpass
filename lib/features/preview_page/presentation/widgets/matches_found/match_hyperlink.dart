import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    const TextStyle defaultStyle = TextStyle(color: Colors.black);
    const TextStyle linkStyle = TextStyle(color: Colors.blue);

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: mainText),
          TextSpan(
            text: clickable,
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
