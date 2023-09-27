import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/widgets/input/textformfield/textformfield.dart';

class BasicTransferTextField extends D3pTextFormField {
  BasicTransferTextField({
    super.autofocus,
    super.bottomHelpText,
    super.controller,
    super.enabled,
    super.hintText,
    super.inputFormatters,
    super.isCollapsed,
    super.key,
    super.keyboardType,
    super.labelButton,
    super.labelText,
    super.maxLen,
    super.maxLines,
    super.obscureText,
    super.onChanged,
    super.onLabelButtonPressed,
    super.onSuffixButtonPressed,
    super.suffixButton,
    super.validator,
    super.makeLabelOutside = true,
    super.border = const UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    // super.focusedBorder = overrideFocusedBorder,
    super.contentPadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
  }) : super(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: D3pThemeData.mainColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            gapPadding: 4,
          ),
        );
}
