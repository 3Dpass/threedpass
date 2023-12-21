import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/theme/d3p_card_theme.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';
import 'package:threedpass/core/theme/d3p_special_styles.dart';

class D3pScreenLockTheme {
  final BuildContext context;

  const D3pScreenLockTheme(this.context);

  ThemeData get theme => Theme.of(context);
  CustomColors get colors => theme.customColors;
  CustomTextStyles get textStyles => theme.customTextStyles;

  Text basicText(final String str) {
    return Text(
      str.tr(),
      style: textStyles.d3ptitleLarge,
    );
  }

  Text get defaultTitle => basicText('screen_lock_title');
  Text get createTitle => basicText('screen_lock_title_set');
  Text get confirmTitle => basicText('screen_lock_title_confirm');

  ScreenLockConfig get config => ScreenLockConfig(
        backgroundColor: colors.scaffoldBackground,
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: colors.themeOpposite,
          backgroundColor: colors.pinButtonBGColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              D3pCardTheme.radius,
            ),
          ),
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
