import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/core/widgets/buttons/icon_button.dart';

class D3pSwitchButton extends StatelessWidget {
  D3pSwitchButton({
    required final bool initialValue,
    required this.onChanged,
    required this.text,
    this.helpText,
    final Key? key,
  })  : switchValueNotifier = ValueNotifier<bool>(initialValue),
        super(key: key);

  final void Function(bool)? onChanged;
  final ValueNotifier<bool> switchValueNotifier;
  final String text;
  final String? helpText;

  @override
  Widget build(final BuildContext context) {
    final customStyles = Theme.of(context).customTextStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              text,
              style: onChanged != null
                  ? customStyles.switchButtonLabelEnabled
                  : customStyles.switchButtonLabelDisabled,
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
        ValueListenableBuilder(
          valueListenable: switchValueNotifier,
          builder: (final context, final hasError, final child) =>
              PlatformSwitch(
            value: switchValueNotifier.value,
            // ignore: prefer-extracting-callbacks
            onChanged: onChanged != null
                ? (final value) {
                    switchValueNotifier.value = value;
                    onChanged!(value);
                  }
                : null,
          ),
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
