import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/scan_settings.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/setup.dart';

class AlgorithmDropdown extends StatelessWidget {
  const AlgorithmDropdown({Key? key}) : super(key: key);

  Future<void> _onAlgorithmChanged(
    BuildContext context,
    SettingsConfigState state,
    Algorithm? newValue,
  ) async {
    if (newValue != null) {
      final state = getIt<SettingsConfigCubit>().state;
      final config = state.settings.copyWith(algorithm: newValue);
      getIt<SettingsConfigCubit>().updateSettings(config);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, SettingsConfigState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) => DropdownButtonFormField<Algorithm>(
        decoration: InputDecoration(
          label: Text('choose_algorithm_label'.tr()),
        ),
        value: state.settings.algorithm,
        onChanged: (Algorithm? newValue) =>
            _onAlgorithmChanged(context, state, newValue),
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
