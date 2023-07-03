import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pScreenLockTheme {
  final BuildContext context;

  const D3pScreenLockTheme(this.context);

  ThemeData get theme => Theme.of(context);
  CustomColors get colors => theme.customColors;

  Text get defaultTitle => Text('screen_lock_title'.tr());
  Text get createTitle => Text('screen_lock_title_set'.tr());
  Text get confirmTitle => Text('screen_lock_title_confirm'.tr());

  ScreenLockConfig get config => ScreenLockConfig(
        backgroundColor: colors.scaffoldBackground,
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: colors.themeOpposite,
          backgroundColor: colors.pinButtonBGColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          side: BorderSide.none,
        ),
      );

  SecretsConfig get secretsConfig => SecretsConfig(
        secretConfig: SecretConfig(
          borderSize: 2,
          borderColor: theme.colorScheme.primary,
          enabledColor: theme.colorScheme.primary,
        ),
      );
}
