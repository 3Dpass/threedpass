import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class MnemonicTextField extends StatelessWidget {
  const MnemonicTextField({
    required this.text,
    final Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(final BuildContext context) {
    return D3pTextFormField(
      readOnly: true,
      controller: TextEditingController(text: text),
    );
  }
}
