import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class GridSizeDropdown extends StatelessWidget {
  const GridSizeDropdown({Key? key}) : super(key: key);

  static const _gridSizes = [6, 7, 8];

  Future<void> _onGridChanged(
    BuildContext context,
    int? newValue,
  ) async {
    if (newValue != null) {
      final state = getIt<SettingsConfigCubit>().state;
      final config = state.settings.copyWith(gridSize: newValue);
      getIt<SettingsConfigCubit>().updateSettings(config);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = getIt<SettingsConfigCubit>().state.settings;

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
