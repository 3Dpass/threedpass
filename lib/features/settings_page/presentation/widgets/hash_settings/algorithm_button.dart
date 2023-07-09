import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class AlgorithmButton extends StatelessWidget {
  const AlgorithmButton({super.key});

  void onPressed(final BuildContext context) {
    context.router.push(const ChooseAlgorithmSubRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.scanSettings.algorithm != current.scanSettings.algorithm,
      builder: (final context, final settingsState) {
        final value = settingsState.scanSettings.algorithm;
        return DefaultSettingsButton.openButton(
          iconData: UniconsLine.diamond,
          iconColor: Colors.purple,
          textValue: value,
          onPressed: () => onPressed(context),
          text: 'algorithm_button_label',
        );
      },
    );
  }
}
