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

class NodeUrlButton extends StatelessWidget {
  const NodeUrlButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsConfigCubit>(context).state;
    context.router.push(WalletNodeSubRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    return Padding16(
      child: BlocBuilder<SettingsConfigCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.walletSettings.nodeUrl != current.walletSettings.nodeUrl,
        builder: (final context, final state) {
          final nodeUrlValue = BlocProvider.of<SettingsConfigCubit>(context)
              .state
              .walletSettings
              .nodeUrl;

          return LineButton(
            icon: const Icon(
              Icons.webhook_outlined,
              color: Colors.amber,
            ),
            localization_key: 'node_url_button_label',
            goToBasicRight: LineButtonRightValue(
              chevronColor: D3pColors.disabled,
              value: nodeUrlValue,
            ),
            onBasePressed: () => onPressed(context),
            cardShape: CardShape.all,
          );
        },
      ),
    );
  }
}
