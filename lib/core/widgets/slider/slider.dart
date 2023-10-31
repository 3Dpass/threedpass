import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

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
    final textStyles = Theme.of(context).customTextStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!.tr(),
            style: textStyles.d3pBodySmall,
          ),
        Row(
          children: [
            Text(
              '${widget.minValue}',
              style: textStyles.d3pBodySmall,
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                child: PlatformSlider(
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
              style: textStyles.d3pBodySmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
          child: Text(
            'pixel_ratio_help_text'.tr(),
            style: textStyles.d3pBodySmall,
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
