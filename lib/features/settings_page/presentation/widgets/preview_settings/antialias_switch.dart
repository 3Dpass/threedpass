import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/input/switch_button.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/preview_settings.dart';

class AntialiasSwitch extends StatelessWidget {
  const AntialiasSwitch({Key? key}) : super(key: key);

  void onChanged(bool newValue, BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newPreviewConfig =
        cubit.state.previewSettings.copyWith(antialias: newValue);
    final newState = cubit.state.copyWith(previewSettings: newPreviewConfig);
    cubit.updateSettings(newState);
  }

  @override
  Widget build(BuildContext context) {
    return D3pSwitchButton(
      text: 'Antialias',
      onChanged: (value) => onChanged(value, context),
      initialValue: BlocProvider.of<SettingsConfigCubit>(context)
          .state
          .previewSettings
          .antialias,
    );
  }
}
