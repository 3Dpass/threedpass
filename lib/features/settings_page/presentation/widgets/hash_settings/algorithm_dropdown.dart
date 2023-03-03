part of '../../settings_page.dart';

class _AlgorithmDropdown extends StatelessWidget {
  const _AlgorithmDropdown({final Key? key}) : super(key: key);

  Future<void> _onAlgorithmChanged(
    final BuildContext context,
    final String? newValue,
  ) async {
    if (newValue != null) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);

      final newScanConfig =
          cubit.state.scanSettings.copyWith(algorithm: newValue);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) => false,
      builder: (final context, final state) =>
          D3pDropdownButtonFormField<String>(
        context: context,
        label: 'choose_algorithm_label',
        value: state.scanSettings.algorithm,
        onChanged: (final String? newValue) =>
            _onAlgorithmChanged(context, newValue),
        items: _AlgorithmDropdownMenuItems().items,
      ),
    );
  }
}

class _AlgorithmDropdownMenuItems {
  List<DropdownMenuItem<String>> get items => AlgorithmMaster.list
      .map(
        (final e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ),
      )
      .toList();
}
