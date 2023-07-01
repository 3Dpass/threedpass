import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/theme/d3p_special_colors.dart';

class D3pScreenLockTheme {}

class D3pScreenLock extends StatelessWidget {
  const D3pScreenLock({
    required this.correctString,
    required this.onUnlocked,
    super.key,
  });

  final String correctString;
  final void Function() onUnlocked;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.customColors;
    return ScreenLock(
      correctString: correctString,
      onUnlocked: onUnlocked,
      config: ScreenLockConfig(
        backgroundColor: colors.scaffoldBackground,
        buttonStyle: OutlinedButton.styleFrom(
          foregroundColor: colors.themeOpposite,
          backgroundColor: colors.pinButtonBGColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          side: BorderSide.none,
        ),
        titleTextStyle: theme.textTheme.headlineSmall,
        textStyle: theme.textTheme.bodyMedium,
      ),
      secretsConfig: SecretsConfig(
        secretConfig: SecretConfig(
          borderSize: 2,
          borderColor: theme.colorScheme.primary,
          enabledColor: theme.colorScheme.primary,
        ),
      ),
      title: Text('Enter PIN code'),
    );
  }
}
