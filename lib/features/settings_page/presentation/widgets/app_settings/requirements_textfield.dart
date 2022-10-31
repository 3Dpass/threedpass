part of '../../settings_page.dart';

class _RequirementsTextField extends StatelessWidget {
  const _RequirementsTextField({final Key? key}) : super(key: key);

  Future<void> _onFieldChanged(
    final BuildContext context,
    final String? newValue,
  ) async {
    if (newValue == null) {
      return;
    } // value is not null

    final actualValue = int.tryParse(newValue);
    if (actualValue == null) {
      return;
    } // value is an integer

    if (actualValue <= 0) {
      return;
    } // value is positive

    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppConfig =
        cubit.state.appSettings.copyWith(stableRequirement: actualValue);
    final newState = cubit.state.copyWith(appSettings: newAppConfig);
    cubit.updateSettings(newState);
  }

  static String? onlyNumValidator(final String? value) {
    if (value != null &&
        int.tryParse(value) != null &&
        int.tryParse(value)! > 0) {
      return null;
    } else {
      return 'error_stable_is_invalid'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.appSettings;

    return D3pTextFormField(
      controller: TextEditingController(
        text: settings.stableRequirement.toString(),
      ),
      onChanged: (final String? newValue) => _onFieldChanged(context, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      labelText: 'stable_requirement_label'.tr(),
      bottomHelpText: 'stable_requirement_help'.tr(),
    );
  }
}
