import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_text_input_theme.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';

part 'suffix_button.dart';
part 'bottom_help_text.dart';
part 'label.dart';

class D3pTextFormField extends StatelessWidget {
  D3pTextFormField({
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
    this.makeLabelOutside = false,
    this.suffixText,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    // this.focusedBorder,
    // this.border,
    this.bottomWidget,
    super.key,
  }) : controller = controller ?? TextEditingController();

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  /// Text to display below the input field
  final String? bottomHelpText;
  final Widget? bottomWidget;

  final TextEditingController controller;
  final bool? enabled;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final IconData? labelButton;
  final String? labelText;
  final int? maxLen;
  final int? maxLines;
  final IconData? suffixButton;
  final String? suffixText;
  final bool obscureText;
  final bool isCollapsed;
  final bool autofocus;
  final EdgeInsetsGeometry contentPadding;

  final bool makeLabelOutside;

  int? get mMaxLines => obscureText ? 1 : maxLines ?? 1;
  // double? get mHeight => labelText == null ? 44 : null;
  // InputBorder get defaultFocusedBorder => OutlineInputBorder(
  //       borderSide: BorderSide(color: D3pThemeData.mainColor, width: 1),
  //     );

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (makeLabelOutside)
          Column(
            children: [
              Text(
                labelText ?? '',
                style: textStyle.hintStyle,
              ),
              const SizedBoxH4(),
            ],
          ),
        SizedBox(
          // height: 48,
          child: TextFormField(
            style: textStyle.d3pBodyLarge,
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              border: D3pTextInputTheme.border,
              focusedBorder: D3pTextInputTheme.focusedBorder,
              contentPadding: contentPadding,
              label: makeLabelOutside ? null : _Label(labelText).build(context),
              suffixIcon: _SuffixButton(
                labelButton: labelButton,
                suffixButton: suffixButton,
                onLabelButtonPressed: onLabelButtonPressed,
                onSuffixButtonPressed: onSuffixButtonPressed,
              ).build(context),
              suffixText: suffixText,
              hintText: hintText,
              hintStyle: textStyle.textInputHintStyle,
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
        bottomWidget ?? _BottomHelpText(bottomHelpText),
      ],
    );
  }
}
