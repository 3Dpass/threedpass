import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/core/theme/d3p_colors.dart';
import 'package:threedpass/core/widgets/d3p_card.dart';
import 'package:threedpass/core/widgets/other/ph16.dart';
import 'package:threedpass/features/rest/bloc/explorer_url_cubit.dart';
import 'package:threedpass/features/settings_page/bloc/settings_cubit.dart';
import 'package:threedpass/features/settings_page/domain/entities/global_settings.dart';
import 'package:threedpass/features/settings_page/presentation/widgets/default_settings_button.dart';
import 'package:threedpass/router/router.gr.dart';

class ExplorerUrlButton extends StatelessWidget {
  const ExplorerUrlButton({super.key});

  void onPressed(final BuildContext context) {
    final settingsState = BlocProvider.of<SettingsCubit>(context).state;
    context.router.push(WalletExplorerSubRoute(initialState: settingsState));
  }

  @override
  Widget build(final BuildContext context) {
    return PH16(
      child: BlocBuilder<SettingsCubit, GlobalSettings>(
        buildWhen: (final previous, final current) =>
            previous.walletSettings.explorerUrl !=
            current.walletSettings.explorerUrl,
        builder: (final context, final state) {
          final explorerUrlValue =
              BlocProvider.of<ExplorerUrlCubit>(context).status;

          return LineButton(
            icon: const Icon(
              Icons.travel_explore_outlined,
              color: Colors.amber,
            ),
            localization_key: 'explorer_url_button_label',
            goToBasicRight: LineButtonRightValue(
              chevronColor: D3pColors.disabled,
              value: explorerUrlValue,
            ),
            onBasePressed: () => onPressed(context),
            cardShape: CardShape.bottom,
          );
        },
      ),
    );
  }
}
