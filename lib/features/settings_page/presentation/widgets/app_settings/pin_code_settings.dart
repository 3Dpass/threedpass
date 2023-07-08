import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_create_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/setup.dart';

class PinCodeSettings extends StatelessWidget {
  const PinCodeSettings({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      builder: (final BuildContext context, final GlobalSettings state) =>
          state.appSettings.pinCode.isEmpty
              ? const _NoPasswordSet()
              : const _PasswordWasSet(),
    );
  }
}

class _NoPasswordSet extends StatelessWidget {
  const _NoPasswordSet({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final homeContextBloc = BlocProvider.of<HomeContextCubit>(context);
    final actualHomeContext = homeContextBloc.state.context;

    final screenLockDialog = D3pScreenLockDialog(
      context: actualHomeContext,
    );
    screenLockDialog.showScreenLockCreate(
      onConfirmed: (final String res) {
        final settings = BlocProvider.of<SettingsConfigCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final newAppSettings = oldAppSettings.copyWith(pinCode: res);
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        getIt<Logger>().i('Set new password $res');
        actualHomeContext.router.pop();
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return DefaultSettingsButton.openButton(
      iconData: Icons.key,
      iconColor: Colors.amber,
      textValue: '',
      onPressed: () => onPressed(context),
      text: 'set_pin_button_label',
    );
  }
}

class _PasswordWasSet extends StatelessWidget {
  const _PasswordWasSet({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    final homeContextBloc = BlocProvider.of<HomeContextCubit>(context);
    final actualHomeContext = homeContextBloc.state.context;
    final settings = BlocProvider.of<SettingsConfigCubit>(context);
    final appSettings = settings.state.appSettings;
    final currentPin = appSettings.pinCode;

    final screenLockDialog = D3pScreenLockDialog(
      context: actualHomeContext,
    );
    screenLockDialog.showScreenLock(
      correctString: currentPin,
      onUnlocked: () {
        final settings = BlocProvider.of<SettingsConfigCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final newAppSettings = oldAppSettings.copyWith(pinCode: '');
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        getIt<Logger>().i('Pin code was removed');
        actualHomeContext.router.pop();
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return DefaultSettingsButton.openButton(
      iconData: Icons.key_off,
      iconColor: Colors.amber,
      textValue: '',
      onPressed: () => onPressed(context),
      text: 'remove_pin_button_label',
    );
  }
}
