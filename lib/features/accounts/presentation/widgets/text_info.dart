import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({
    required this.text,
    required this.bigBottomPadding,
    final Key? key,
  }) : super(key: key);

  final bool bigBottomPadding;
  final String text;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bigBottomPadding ? 32 : 5),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
