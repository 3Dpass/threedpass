import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MatchHyperlink extends StatelessWidget {
  const MatchHyperlink({
    Key? key,
    required this.clickable,
    required this.mainText,
    required this.onTap,
  }) : super(key: key);

  final String clickable;
  final String mainText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);

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
