part of '../../settings_page.dart';

class _GridSizeDropdown extends StatelessWidget {
  const _GridSizeDropdown({final Key? key}) : super(key: key);

  static const _gridSizes = [6, 7, 8, 9, 10];

  Future<void> _onGridChanged(
    final BuildContext context,
    final int? newValue,
  ) async {
    if (newValue != null) {
      final cubit = BlocProvider.of<SettingsConfigCubit>(context);
      final newScanConfig =
          cubit.state.scanSettings.copyWith(gridSize: newValue);
      final newState = cubit.state.copyWith(scanSettings: newScanConfig);
      cubit.updateSettings(newState);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    return D3pDropdownButtonFormField<int>(
      context: context,
      label: 'grid_size_label',
      value: settings.gridSize,
      onChanged: (final int? newValue) => _onGridChanged(context, newValue),
      items: _gridSizes
          .map(
            (final e) => DropdownMenuItem<int>(
              value: e,
              child: Text('${e}x$e'),
            ),
          )
          .toList(),
    );
  }
}
