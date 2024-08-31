import 'package:flutter/material.dart';
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
      maxLines: 3,
      enableInteractiveSelection: false,
    );
  }
}
