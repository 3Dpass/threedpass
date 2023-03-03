import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({
    required this.text,
    final Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: Theme.of(context)
            .customTextStyles
            .d3ptitleLarge
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
