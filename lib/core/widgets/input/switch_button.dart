import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pSwitchButton extends StatelessWidget {
  D3pSwitchButton({
    required final bool initialValue,
    required this.onChanged,
    required this.text,
    final Key? key,
  })  : switchValueNotifier = ValueNotifier<bool>(initialValue),
        super(key: key);

  final void Function(bool)? onChanged;
  final ValueNotifier<bool> switchValueNotifier;
  final String text;

  @override
  Widget build(final BuildContext context) {
    final customStyles = Theme.of(context).customTextStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: onChanged != null
              ? customStyles.switchButtonLabelEnabled
              : customStyles.switchButtonLabelDisabled,
        ),
        ValueListenableBuilder(
          valueListenable: switchValueNotifier,
          builder: (final context, final hasError, final child) =>
              PlatformSwitch(
            activeColor: Theme.of(context).colorScheme.secondary,
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
}
