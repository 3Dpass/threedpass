import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class MnemonicTextField extends StatelessWidget {
  const MnemonicTextField({
    required this.text,
    final Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(final BuildContext context) {
    print('a' + Theme.of(context).brightness.toString());
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).customColors.mnemonicInputBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Text(
        text,
      ),
    );
  }
}
