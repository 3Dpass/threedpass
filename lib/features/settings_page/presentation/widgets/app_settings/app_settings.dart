import 'package:flutter/material.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/dark_theme_switch.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/pin_code_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/requirements_button.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/app_settings/show_zero_assets.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/settings_section_header.dart';

class AppSettingsBlock extends StatelessWidget {
  const AppSettingsBlock({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionHeader(
          title: 'app_settings_title',
        ),
        // const _RequirementsTextField(),
        RequirementsButton(),
        DarkThemeSwitch(),
        // ShowZeroAssets(), // TODO Adapt to new types of assets or delete
        PinCodeSettings(),
      ],
    );
  }
}
