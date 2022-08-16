import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class AlgorithmDropdown extends StatelessWidget {
  const AlgorithmDropdown({Key? key}) : super(key: key);

  Future<void> _onAlgorithmChanged(
    BuildContext context,
    Algorithm? newValue,
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
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (previous, current) => false,
      builder: (context, state) => DropdownButtonFormField<Algorithm>(
        decoration: InputDecoration(
          label: Text('choose_algorithm_label'.tr()),
        ),
        value: state.scanSettings.algorithm,
        onChanged: (Algorithm? newValue) =>
            _onAlgorithmChanged(context, newValue),
        items: Algorithm.values
            .map(
              (e) => DropdownMenuItem<Algorithm>(
                value: e,
                child: Text(e.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
