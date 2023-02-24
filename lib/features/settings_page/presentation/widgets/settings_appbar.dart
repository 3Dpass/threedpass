import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/core/widgets/appbars/d3p_platfrom_appbar.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hide_keyboard_check_button.dart';

class SettingsAppbar extends D3pPlatformAppBar {
  SettingsAppbar({
    final Key? key,
  }) : super(
          key: key,
          titleText: 'settings_title',
          trailingActions: const [
            SizedBox(
              height: kToolbarHeight,
              child: Center(
                child: HideKeyboardCheckButton(),
              ),
            ),
          ],
        );
}
