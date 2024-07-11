import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';

@Deprecated('Use default D3P widget')
class SettingsAppbar extends D3pPlatformAppBar {
  SettingsAppbar({
    final Key? key,
  }) : super(
          key: key,
          titleText: 'settings_title',
        );
}
