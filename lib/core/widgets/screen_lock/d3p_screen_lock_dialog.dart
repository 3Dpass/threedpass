import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:threedpass/core/utils/hash2.dart';
import 'package:threedpass/core/utils/m_app_install_date.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_theme.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/setup.dart';

class D3pScreenLockDialog {
  final BuildContext context;

  const D3pScreenLockDialog({
    required this.context,
  });

  static const pinDigits = 6;
  static final dummyCorrectString = '0' * pinDigits;

  void showScreenLock({
    required final void Function() onUnlocked,
  }) {
    final slTheme = D3pScreenLockTheme(context);

    unawaited(
      screenLock(
        context: context,
        correctString: dummyCorrectString,
        onUnlocked: onUnlocked,
        config: slTheme.config,
        secretsConfig: slTheme.secretsConfig,
        title: slTheme.defaultTitle,
        onValidate: onValidate,
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

  static int hashPin(String rawData) {
    final appInstallDate =
        getIt<DateTime>(instanceName: MAppInstallDate.instanceName)
            .millisecondsSinceEpoch;
    return hash2(rawData, appInstallDate);
  }

  static Future<bool> onValidate(String rawInput) {
    final settings = getIt<SettingsCubit>();
    final appSettings = settings.state.appSettings;
    final oldPin = appSettings.oldPinCode;
    final newPin = appSettings.newPinHash;

    final oldCorrect = rawInput == oldPin;
    final newCorrect = newPin != null && hashPin(rawInput) == newPin;
    return Future.value(oldCorrect || newCorrect);
  }
}
