import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/domain/entities/settings_config.dart';
import 'package:threedpass/features/settings_page/presentation/cubit/settings_page_cubit.dart';

class AlgorithmDropdown extends StatelessWidget {
  const AlgorithmDropdown({Key? key}) : super(key: key);

  Future<void> _onAlgorithmChanged(
    BuildContext context,
    SettingsConfigState state,
    Algorithm? newValue,
  ) async {
    if (newValue != null) {
      final config = state.settings.copyWith(algorithm: newValue);
      BlocProvider.of<SettingsConfigCubit>(context).updateSettings(config);
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
