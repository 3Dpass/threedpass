import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_theme.dart';

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
    final slTheme = D3pScreenLockTheme(context);

    return ScreenLock(
      correctString: correctString,
      onUnlocked: onUnlocked,
      config: slTheme.config,
      secretsConfig: slTheme.secretsConfig,
      title: slTheme.defaultTitle,
    );
  }
}
