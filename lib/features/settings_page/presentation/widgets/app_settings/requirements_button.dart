import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class RequirementsButton extends StatelessWidget {
  const RequirementsButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    context.router.push(StableHashSubRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.appSettings.stableRequirement !=
          current.appSettings.stableRequirement,
      builder: (final context, final state) {
        return DefaultSettingsButton.openButton(
          iconData: Icons.settings,
          iconColor: Colors.purple,
          textValue: state.appSettings.stableRequirement.toString(),
          onPressed: () => onPressed(context),
          text: 'stable_requirement_button_text',
        );
      },
    );
  }
}
