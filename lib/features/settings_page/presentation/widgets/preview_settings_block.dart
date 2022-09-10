import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/antialias_switch.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/pixel_ratio_slider.dart';

class PreviewSettingsBlock extends StatelessWidget {
  const PreviewSettingsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'preview_settings_title'.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        const PixelRatioSlider(),
        const SizedBox(height: 8),
        const AntialiasSwitch(),
        const SizedBox(height: 16),
      ],
    );
  }
}
