import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/utils/get_theme.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';
import 'package:threedpass/core/widgets/paddings.dart';

part 'suffix_button.dart';
part 'bottom_help_text.dart';
part 'label.dart';

class D3pTextFormField extends StatelessWidget {
  D3pTextFormField({
    super.key,
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
    this.enabled = true,
    this.obscureText = false,
    this.maxLines,
    this.isCollapsed = false,
    this.autofocus = false,
    this.makeLabelOutside = false,
    this.suffixText,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    // this.focusedBorder,
    // this.border,
    this.bottomWidget,
  }) : controller = controller ?? TextEditingController();

  final void Function()? onLabelButtonPressed;
  final void Function()? onSuffixButtonPressed;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  /// Text to display below the input field
  final String? bottomHelpText;
  final Widget? bottomWidget;

  final TextEditingController controller;
  final bool enabled;
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
  final bool readOnly;
  final bool enableInteractiveSelection;

  final bool makeLabelOutside;

  int? get mMaxLines => obscureText ? 1 : maxLines ?? 1;
  // double? get mHeight => labelText == null ? 44 : null;
  // InputBorder get defaultFocusedBorder => OutlineInputBorder(
  //       borderSide: BorderSide(color: D3pThemeData.mainColor, width: 1),
  //     );

  @override
  Widget build(final BuildContext context) {
    // final textStyle = Theme.of(context).customTextStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (makeLabelOutside)
          Column(
            children: [
              Text(
                labelText ?? '',
                // style: textStyle.fadedBodyMedium,
              ),
              const H4(),
            ],
          ),
        SizedBox(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: makeLabelOutside ? null : _Label(labelText).build(context),
              hintText: hintText,
              isCollapsed: isCollapsed,
              isDense: false,
              contentPadding: contentPadding,
              suffixIcon: _SuffixButton(
                labelButton: labelButton,
                suffixButton: suffixButton,
                onLabelButtonPressed: onLabelButtonPressed,
                onSuffixButtonPressed: onSuffixButtonPressed,
                isTextFieldEnabled: enabled,
              ).build(context),
              suffixText: suffixText,
              filled: true,
            ),
            keyboardType: keyboardType,
            autofocus: autofocus,
            readOnly: readOnly,
            obscureText: obscureText,
            maxLines: mMaxLines,
            maxLength: maxLen,
            onChanged: onChanged,
            validator: validator,
            inputFormatters: inputFormatters,
            enabled: enabled,
            enableInteractiveSelection: enableInteractiveSelection,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        bottomWidget ?? _BottomHelpText(bottomHelpText),
      ],
    );
  }
}
