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

class GridSizeButton extends StatelessWidget {
  const GridSizeButton({super.key});

  Future<void> onPressed(final BuildContext context) async {
    await context.router.push(const GridSizeSubRoute());
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: BlocBuilder<SettingsConfigCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.scanSettings.gridSize != current.scanSettings.gridSize,
        builder: (final context, final settingsState) {
          final value = settingsState.scanSettings.gridSize;
          final stringValue = '${value}x$value';

          return LineButton(
            icon: const Icon(
              UniconsLine.table,
              color: Colors.purple,
            ),
            localization_key: 'grid_size_label',
            goToBasicRight: LineButtonRightValue(
              chevronColor: D3pColors.disabled,
              value: stringValue,
            ),
            onBasePressed: () => onPressed(context),
            cardShape: CardShape.middle,
          );
        },
      ),
    );
  }
}
