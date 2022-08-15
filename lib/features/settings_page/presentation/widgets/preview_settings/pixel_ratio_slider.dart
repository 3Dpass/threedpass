import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class PixelRatioSlider extends StatefulWidget {
  const PixelRatioSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PixelRatioSlider> {
  late double value;

  static const minValue = 0.4;
  static const maxValue = 1.0;

  @override
  void initState() {
    super.initState();
    final previewSettings = getIt<SettingsConfigCubit>().state.previewSettings;
    value = previewSettings.pixelRatio;
  }

  Future<void> _onFieldChanged(
    BuildContext context,
    ScanSettings settings,
    double? newValue,
  ) async {
    setState(() {
      if (newValue != null) {
        value = newValue;
        final state = getIt<SettingsConfigCubit>().state;
        final newPreviewConfig =
            state.previewSettings.copyWith(pixelRatio: newValue);
        final newState = state.copyWith(previewSettings: newPreviewConfig);
        getIt<SettingsConfigCubit>().updateSettings(newState);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = getIt<SettingsConfigCubit>().state.scanSettings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'preview_settings_pixel_ratio_label'.tr(),
          style: Theme.of(context).textTheme.caption,
        ),
        Row(
          children: [
            const Text('$minValue'),
            Flexible(
              child: Slider(
                value: value,
                min: minValue,
                max: maxValue,
                divisions: 5,
                onChanged: (double? newValue) =>
                    _onFieldChanged(context, settings, newValue),
              ),
            ),
            const Text('$maxValue'),
          ],
        ),
      ],
    );
  }
}
