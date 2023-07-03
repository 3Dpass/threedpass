import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class PixelRatioButton extends StatelessWidget {
  const PixelRatioButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    context.router.push(PixelRatioSubRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    final value = settingsState.previewSettings.pixelRatio;
    return DefaultSettingsButton.openButton(
      iconData: UniconsLine.exposure_alt,
      iconColor: Colors.green,
      textValue: value.toString(),
      onPressed: () => onPressed(context),
      text: 'preview_settings_pixel_ratio_label',
    );
  }
}
