part of '../../settings_page.dart';

class _SectionsTextField extends StatelessWidget {
  const _SectionsTextField({final Key? key}) : super(key: key);

  Future<void> _onFieldChanged(
    final BuildContext context,
    final String? newValue,
  ) async {
    if (newValue != null && int.tryParse(newValue) != null) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(nSections: int.parse(newValue));
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  static String? onlyNumValidator(final String? value) {
    if (value != null && int.tryParse(value) != null) {
      return null;
    } else {
      return 'error_n_sections_validator'.tr();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    return D3pTextFormField(
      controller: TextEditingController(
        text: settings.nSections.toString(),
      ),
      onChanged: (final String? newValue) => _onFieldChanged(context, newValue),
      keyboardType: TextInputType.number,
      validator: onlyNumValidator,
      labelText: 'n_sections_label'.tr(),
    );
  }
}
