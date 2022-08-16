import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class D3pSwitchButton extends StatelessWidget {
  D3pSwitchButton({
    Key? key,
    required bool initialValue,
    required this.onChanged,
    required this.text,
  })  : switchValueNotifier = ValueNotifier<bool>(initialValue),
        super(key: key);

  final ValueNotifier<bool> switchValueNotifier;
  final String text;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        ValueListenableBuilder(
          valueListenable: switchValueNotifier,
          builder: (context, hasError, child) => PlatformSwitch(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: switchValueNotifier.value,
            // ignore: prefer-extracting-callbacks
            onChanged: (value) {
              switchValueNotifier.value = value;
              onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
