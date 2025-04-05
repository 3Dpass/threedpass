import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_dialog.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';

class PinCodeSettings extends StatelessWidget {
  const PinCodeSettings({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsCubit, GlobalSettings>(
      builder: (final BuildContext context, final GlobalSettings state) =>
          state.appSettings.isPinSet
              ? const _PasswordWasSet()
              : const _NoPasswordSet(),
    );
  }
}

class _NoPasswordSet extends StatelessWidget {
  const _NoPasswordSet({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final screenLockDialog = D3pScreenLockDialog(
      context: context,
    );
    screenLockDialog.showScreenLockCreate(
      onConfirmed: (final String rawPin) {
        final settings = BlocProvider.of<SettingsCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final h = D3pScreenLockDialog.hashPin(rawPin);
        final newAppSettings = oldAppSettings.copyWith(
          oldPinCode: '',
          newPinHash: h,
        );
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        context.maybePop();
        logger.i('Set new password $h');
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: LineButton(
        icon: const Icon(
          Icons.key,
          color: Colors.amber,
        ),
        localization_key: 'set_pin_button_label',
        goToBasicRight: const LineButtonRightValue(
          chevronColor: D3pColors.disabled,
          value: '',
        ),
        onBasePressed: () => onPressed(context),
        cardShape: CardShape.middle,
      ),
    );
  }
}

class _PasswordWasSet extends StatelessWidget {
  const _PasswordWasSet({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final screenLockDialog = D3pScreenLockDialog(
      context: context,
    );
    screenLockDialog.showScreenLock(
      onUnlocked: () {
        final settings = BlocProvider.of<SettingsCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final newAppSettings = oldAppSettings.copyWith(
          oldPinCode: '',
          newPinHash: null,
        );
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        context.maybePop();
        logger.i('Pin code was removed');
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: LineButton(
        icon: const Icon(
          Icons.key_off,
          color: Colors.amber,
        ),
        localization_key: 'remove_pin_button_label',
        goToBasicRight: const LineButtonRightValue(
          chevronColor: D3pColors.disabled,
          value: '',
        ),
        onBasePressed: () => onPressed(context),
        cardShape: CardShape.middle,
      ),
    );
  }
}
