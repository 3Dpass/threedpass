import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/utils/empty_function.dart';

part 'suffix_button.dart';
part 'bottom_help_text.dart';
part 'label.dart';

class D3pTextFormField extends StatelessWidget {
  D3pTextFormField({
    final Key? key,
    final TextEditingController? controller,
    this.hintText,
    this.labelText,
    this.labelButton,
    this.onLabelButtonPressed,
    this.suffixButton,
    this.onSuffixButtonPressed,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.maxLen,
    this.bottomHelpText,
    this.enabled,
    this.obscureText = false,
    this.maxLines,
    this.isCollapsed = false,
    this.autofocus = false,
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  /// Text to display below the input field
  final String? bottomHelpText;

  final TextEditingController controller;
  final bool? enabled;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelButton;
  final String? labelText;
  final int? maxLen;
  final int? maxLines;
  final String? suffixButton;
  final bool obscureText;
  final bool isCollapsed;
  final bool autofocus;

  TextStyle hintStyle(final CustomTextStyles textStyles) {
    return textStyles.d3pBodyMedium.copyWith(color: D3pColors.disabled);
  }

  UnderlineInputBorder get focusedBorder => UnderlineInputBorder(
        borderSide: BorderSide(color: D3pThemeData.mainColor),
      );

  int? get mMaxLines => obscureText ? 1 : maxLines ?? 1;

  double? get mHeight => labelText == null ? 44 : null;

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          // height: 55,
          child: TextFormField(
            style: textStyle.d3pBodyLarge,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              focusedBorder: focusedBorder,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              label: _Label(labelText).build(context),
              suffixIcon: _SuffixButton(
                labelButton: labelButton,
                suffixButton: suffixButton,
                onLabelButtonPressed: onLabelButtonPressed,
                onSuffixButtonPressed: onSuffixButtonPressed,
              ).build(context),
              hintText: hintText,
              hintStyle: hintStyle(textStyle),
              isCollapsed: isCollapsed,
            ),
            autofocus: autofocus,
            controller: controller,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            maxLength: maxLen,
            enabled: enabled,
            validator: validator,
            maxLines: mMaxLines,
            keyboardType: keyboardType,
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        _BottomHelpText(bottomHelpText),
      ],
    );
  }
}
