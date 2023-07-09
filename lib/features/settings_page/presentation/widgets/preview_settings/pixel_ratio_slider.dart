import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/slider/slider.dart';

class PixelRatioSlider extends StatelessWidget {
  const PixelRatioSlider({required this.valueNotifier, super.key});

  final ValueNotifier<double> valueNotifier;

  static const maxValue = 1.0;
  static const minValue = 0.4;

  @override
  Widget build(final BuildContext context) {
    return D3pSlider(
      valueNotifier: valueNotifier,
      minValue: minValue,
      maxValue: maxValue,
      divisions: 5,
      label: 'preview_settings_pixel_ratio_label',
      helpText: 'pixel_ratio_help_text',
    );
  }
}
