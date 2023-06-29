part of '../../settings_page.dart';

class _PinCodeSettings extends StatelessWidget {
  const _PinCodeSettings({final Key? key}) : super(key: key);

  void onChanged(final bool newValue, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppSettings =
        cubit.state.appSettings.copyWith(darkTheme: newValue);
    final newState = cubit.state.copyWith(appSettings: newAppSettings);
    cubit.updateSettings(newState);
    // test1.value = !test1.value;
    if (Platform.isIOS) {
      Phoenix.rebirth(context);
    }
  }

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

    screenLockCreate(
      context: actualHomeContext,
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

    screenLock(
      context: actualHomeContext,
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
