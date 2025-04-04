import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/utils/logger.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
import 'package:threedpass/core/widgets/screen_lock/d3p_screen_lock_create_dialog.dart';
import 'package:threedpass/features/home_page/bloc/home_context_cubit.dart';
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
        final settings = BlocProvider.of<SettingsCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final newAppSettings = oldAppSettings.copyWith(pinCode: res);
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        logger.i('Set new password $res');
        actualHomeContext.router.pop();
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
    final homeContextBloc = BlocProvider.of<HomeContextCubit>(context);
    final actualHomeContext = homeContextBloc.state.context;
    final settings = BlocProvider.of<SettingsCubit>(context);
    final appSettings = settings.state.appSettings;
    final currentPin = appSettings.pinCode;

    final screenLockDialog = D3pScreenLockDialog(
      context: actualHomeContext,
    );
    screenLockDialog.showScreenLock(
      correctString: currentPin,
      onUnlocked: () {
        final settings = BlocProvider.of<SettingsCubit>(context);
        final oldGlobal = settings.state;
        final oldAppSettings = oldGlobal.appSettings;
        final newAppSettings = oldAppSettings.copyWith(pinCode: '');
        final newGlobal = oldGlobal.copyWith(appSettings: newAppSettings);
        settings.updateSettings(newGlobal);

        logger.i('Pin code was removed');
        actualHomeContext.router.pop();
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
