import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_theme.dart';

class D3pScreenLockDialog {
  final BuildContext context;

  const D3pScreenLockDialog({
    required this.context,
  });

  static const pinDigits = 6;

  void showScreenLock({
    required final void Function() onUnlocked,
    required final String correctString,
  }) {
    final slTheme = D3pScreenLockTheme(context);

    unawaited(
      screenLock(
        context: context,
        correctString: correctString,
        onUnlocked: onUnlocked,
        config: slTheme.config,
        secretsConfig: slTheme.secretsConfig,
        title: slTheme.defaultTitle,
      ),
    );
  }

  void showScreenLockCreate({
    required final void Function(String) onConfirmed,
  }) {
    final slTheme = D3pScreenLockTheme(context);

    unawaited(
      screenLockCreate(
        context: context,
        onConfirmed: onConfirmed,
        config: slTheme.config,
        secretsConfig: slTheme.secretsConfig,
        title: slTheme.createTitle,
        confirmTitle: slTheme.confirmTitle,
        digits: pinDigits,
      ),
    );
  }
}
