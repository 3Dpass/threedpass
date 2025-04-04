import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threedpass/features/other/card_with_buttons/fast_card_button.dart';
import 'package:threedpass/features/poscan_assets/bloc/poscan_assets_cubit.dart';
import 'package:threedpass/router/router.gr.dart';

class CreatePoolCardButton extends StatelessWidget {
  const CreatePoolCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoscanAssetsCubit, PoscanAssetsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return FastCardButton(
          iconData: Icons.add,
          title: 'liquidity_pools_buttons_panel_create_pool',
          isLoading: state.isLoading,
          onButtonPressed: state.isLoading
              ? null
              : () => context.router.push(const CreatePoolRouteWrapper()),
        );
      },
    );
  }
}
