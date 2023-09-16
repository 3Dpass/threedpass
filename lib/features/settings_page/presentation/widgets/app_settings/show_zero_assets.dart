import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/app_settings.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';

class ShowZeroAssets extends StatelessWidget {
  const ShowZeroAssets({final Key? key}) : super(key: key);

  void onChanged(final bool newValue, final BuildContext context) {
    final cubit = BlocProvider.of<SettingsConfigCubit>(context);
    final newAppSettings =
        cubit.state.appSettings.copyWith(showZeroAssets: newValue);
    final newState = cubit.state.copyWith(appSettings: newAppSettings);
    cubit.updateSettings(newState);
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.showZeroAssets !=
              current.appSettings.showZeroAssets ||
          previous.appSettings.darkTheme != current.appSettings.darkTheme,
      builder: (final context, final state) => DefaultSettingsButton.boolean(
        text: 'show_zero_assets_label',
        iconData: Icons.exposure_zero_outlined,
        iconColor: Colors.green,
        initialValue: state.appSettings.showZeroAssets,
        onPressedBool: (final bool p0) => onChanged(p0, context),
      ),
    );
  }
}
