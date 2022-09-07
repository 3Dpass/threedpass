import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

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
    final previewSettings =
        BlocProvider.of<SettingsConfigCubit>(context).state.previewSettings;
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
        final cubit = BlocProvider.of<SettingsConfigCubit>(context);
        final newPreviewConfig =
            cubit.state.previewSettings.copyWith(pixelRatio: newValue);
        final newState =
            cubit.state.copyWith(previewSettings: newPreviewConfig);
        cubit.updateSettings(newState);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    return Column(
      mainAxisSize: MainAxisSize.min,
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
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
          child: Text(
            'pixel_ratio_help_text'.tr(),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
