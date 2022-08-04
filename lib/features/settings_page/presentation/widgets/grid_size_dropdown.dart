import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';

class GridSizeDropdown extends StatelessWidget {
  const GridSizeDropdown({Key? key}) : super(key: key);

  static const _gridSizes = [6, 7, 8];

  Future<void> _onGridChanged(
    BuildContext context,
    SettingsConfigState state,
    int? newValue,
  ) async {
    if (newValue != null) {
      final config = state.settings.copyWith(gridSize: newValue);
      BlocProvider.of<SettingsConfigCubit>(context).updateSettings(config);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, SettingsConfigState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) => DropdownButtonFormField<int>(
        decoration: InputDecoration(
          label: Text('grid_size_label'.tr()),
        ),
        value: state.settings.gridSize,
        onChanged: (int? newValue) => _onGridChanged(context, state, newValue),
        items: _gridSizes
            .map(
              (e) => DropdownMenuItem<int>(
                value: e,
                child: Text('${e}x$e'),
              ),
            )
            .toList(),
      ),
    );
  }
}
