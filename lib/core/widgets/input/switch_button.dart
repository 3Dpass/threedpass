import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class D3pSwitchButton extends StatelessWidget {
  const D3pSwitchButton({
    required this.value,
    required this.onChanged,
    required this.text,
    this.helpText,
    super.key,
  });

  final void Function(bool)? onChanged;
  final String text;
  final String? helpText;
  final bool value;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final customStyles = theme.customTextStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: onChanged != null
                  ? theme.textTheme.bodyMedium
                  : customStyles.fadedBodyMedium,
            ),
            if (helpText != null)
              D3pIconButton(
                iconData: Icons.info_outline_rounded,
                size: 20,
                iconColor: Colors.blue,
                onPressed: showHelp,
              ),
          ],
        ),
        Switch.adaptive(
          value: value,
          onChanged:
              onChanged != null ? (final value) => onChanged!(value) : null,
        ),
      ],
    );
  }

  void showHelp() {
    // TODO show dialog instead of toast
    Fluttertoast.showToast(
      msg: helpText ?? '',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
