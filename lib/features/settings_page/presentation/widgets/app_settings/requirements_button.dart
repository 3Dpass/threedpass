part of '../../settings_page.dart';

class _RequirementsButton extends StatelessWidget {
  const _RequirementsButton();

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    context.router.push(StableHashSubPageRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    final value = settingsState.appSettings.stableRequirement;
    return DefaultSettingsButton.openButton(
      iconData: Icons.settings,
      iconColor: Colors.purple,
      textValue: value.toString(),
      onPressed: () => onPressed(context),
      text: 'stable_requirement_button_text',
    );
  }
}
