import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

class GridSizeDropdown extends StatelessWidget {
  const GridSizeDropdown({Key? key}) : super(key: key);

  static const _gridSizes = [6, 7, 8, 9, 10];

  Future<void> _onGridChanged(
    BuildContext context,
    int? newValue,
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
  Widget build(BuildContext context) {
    final settings =
        BlocProvider.of<SettingsConfigCubit>(context).state.scanSettings;

    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        label: Text('grid_size_label'.tr()),
      ),
      value: settings.gridSize,
      onChanged: (int? newValue) => _onGridChanged(context, newValue),
      items: _gridSizes
          .map(
            (e) => DropdownMenuItem<int>(
              value: e,
              child: Text('${e}x$e'),
            ),
          )
          .toList(),
    );
  }
}
