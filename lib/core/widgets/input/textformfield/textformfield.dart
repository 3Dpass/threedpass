import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/theme/d3p_theme.dart';
import 'package:threedpass/core/utils/empty_function.dart';

part 'suffix_button.dart';
part 'bottom_help_text.dart';

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
    this.obscureText,
    this.maxLines,
    this.isCollapsed = false,
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
  final bool? obscureText;
  final bool isCollapsed;

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context).customTextStyles;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: labelText == null ? 44 : null,
          child: TextFormField(
            style: textStyle.d3pBodyLarge,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: D3pThemeData.mainColor),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              label: Text(
                labelText ?? '',
                style: textStyle.d3pBodyMedium,
              ),
              suffixIcon: _SuffixButton(
                labelButton: labelButton,
                suffixButton: suffixButton,
                onLabelButtonPressed: onLabelButtonPressed,
                onSuffixButtonPressed: onSuffixButtonPressed,
              ).build(context),
              hintText: hintText,
              isCollapsed: isCollapsed,
            ),
            controller: controller,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            maxLength: maxLen,
            enabled: enabled,
            validator: validator,
            maxLines: maxLines,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        _BottomHelpText(bottomHelpText),
      ],
    );
  }
}
