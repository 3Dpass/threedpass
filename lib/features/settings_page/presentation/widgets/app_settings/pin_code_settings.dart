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
              : _PasswordWasSet(),
    );
  }
}

class _NoPasswordSet extends StatelessWidget {
  const _NoPasswordSet({final Key? key}) : super(key: key);

  void onPressed(final BuildContext context) {
    screenLockCreate(
      context: context,
      // inputController: inputController,
      onConfirmed: (final String res) {
        print(res);
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return DefaultSettingsButton.openButton(
      iconData: Icons.key_off_rounded,
      iconColor: Colors.yellow,
      textValue: '',
      onPressed: () => onPressed(context),
      text: '#Set pin code#',
    );
  }
}

class _PasswordWasSet extends StatelessWidget {
  const _PasswordWasSet({final Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
