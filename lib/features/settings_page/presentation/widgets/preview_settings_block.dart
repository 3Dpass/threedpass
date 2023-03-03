import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/antialias_switch.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/pixel_ratio_slider.dart';

class PreviewSettingsBlock extends StatelessWidget {
  const PreviewSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Text(
          'preview_settings_title'.tr(),
          style: Theme.of(context).customTextStyles.d3ptitleLarge,
        ),
        const PixelRatioSlider(),
        const SizedBox(height: 8),
        const AntialiasSwitch(),
        const SizedBox(height: 16),
      ],
    );
  }
}
