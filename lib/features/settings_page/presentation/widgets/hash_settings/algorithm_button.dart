import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/padding_16.dart';
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
    return Padding16(
      child: BlocBuilder<SettingsConfigCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.scanSettings.algorithm != current.scanSettings.algorithm,
        builder: (final context, final settingsState) {
          final value = settingsState.scanSettings.algorithm;

          return LineButton(
            icon: const Icon(
              UniconsLine.diamond,
              color: Colors.purple,
            ),
            localization_key: 'algorithm_button_label',
            goToBasicRight: LineButtonRightValue(
              chevronColor: D3pColors.disabled,
              value: value,
            ),
            onBasePressed: () => onPressed(context),
            cardShape: CardShape.top,
          );
        },
      ),
    );
  }
}
