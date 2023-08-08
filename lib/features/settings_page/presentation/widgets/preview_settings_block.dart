import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/antialias_switch.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/preview_settings/pixel_ratio_button.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_section_header.dart';

class PreviewSettingsBlock extends StatelessWidget {
  const PreviewSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionHeader(
          title: 'preview_settings_title',
        ),
        PixelRatioButton(),
        AntialiasSwitch(),
      ],
    );
  }
}
