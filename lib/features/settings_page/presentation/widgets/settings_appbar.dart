import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:threedpass/core/widgets/appbars/common_logo_appbar.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/hide_keyboard_check_button.dart';

class SettingsAppbar extends CommonLogoAppbar {
  SettingsAppbar({
    final Key? key,
  }) : super(
          key: key,
          title: 'settings_title'.tr(),
          actions: const [
            SizedBox(
              height: kToolbarHeight,
              child: Center(
                child: HideKeyboardCheckButton(),
              ),
            ),
          ],
        );
}
