import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class D3pSlider extends StatefulWidget {
  const D3pSlider({
    required this.valueNotifier,
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    this.label,
    this.helpText,
    super.key,
  });

  final ValueNotifier<double> valueNotifier;
  final double minValue;
  final double maxValue;
  final int divisions;

  final String? label;
  final String? helpText;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<D3pSlider> {
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    // final textStyles = theme.customTextStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!.tr(),
            style: theme.textTheme.bodySmall,
          ),
        Row(
          children: [
            Text(
              '${widget.minValue}',
              style: theme.textTheme.bodySmall,
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                child: Platform.isIOS || Platform.isMacOS
                    ? CupertinoSlider(
                        value: widget.valueNotifier.value,
                        min: widget.minValue,
                        max: widget.maxValue,
                        divisions: widget.divisions,
                        onChanged: onChanged,
                      )
                    : Slider(
                        value: widget.valueNotifier.value,
                        min: widget.minValue,
                        max: widget.maxValue,
                        divisions: widget.divisions,
                        onChanged: onChanged,
                      ),
              ),
            ),
            Text(
              '${widget.maxValue}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
          child: Text(
            'pixel_ratio_help_text'.tr(),
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  void onChanged(final double? newValue) {
    if (newValue != null) {
      setState(() {
        widget.valueNotifier.value = newValue;
      });
    }
  }
}
