import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/features/settings_page/bloc/settings_page_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';
import 'package:unicons/unicons.dart';

class SectionsButton extends StatelessWidget {
  const SectionsButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    context.router.push(SectionsSubRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<SettingsConfigCubit, GlobalSettings>(
      buildWhen: (final previous, final current) =>
          previous.scanSettings.nSections != current.scanSettings.nSections,
      builder: (final context, final state) {
        return DefaultSettingsButton.openButton(
          text: 'n_sections_label',
          iconData: UniconsLine.th_slash,
          iconColor: Colors.purple,
          textValue: state.scanSettings.nSections.toString(),
          onPressed: () => onPressed(context),
          cardShape: CardShape.middle,
        );
      },
    );
  }
}
